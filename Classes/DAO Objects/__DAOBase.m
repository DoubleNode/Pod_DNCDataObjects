//
//  __DAOBase.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import <objc/runtime.h>

#import "__DAOBase.h"

@implementation DAOBase

+ (NSArray*)propertyNames
{
    // Check for a cached value (we use _cmd as the cache key, which represents @selector(propertyNames))
    NSMutableArray* array = objc_getAssociatedObject(self.class, _cmd);
    if (array)
    {
        return array;
    }
    
    // Loop through our superclasses until we hit NSObject
    array = NSMutableArray.array;
    
    Class subclass = self.class;
    while (subclass != NSObject.class)
    {
        unsigned int        propertyCount;
        objc_property_t*    properties = class_copyPropertyList(subclass, &propertyCount);
        
        for (int i = 0; i < propertyCount; i++)
        {
            // Get property name
            objc_property_t property        = properties[i];
            const char*     propertyName    = property_getName(property);
            NSString*       key             = @(propertyName);
            
            // Check if there is a backing ivar
            char*   ivar = property_copyAttributeValue(property, "V");
            if (ivar)
            {
                // Check if ivar has KVC-compliant name
                NSString*   ivarName = @(ivar);
                if ([ivarName isEqualToString:key] ||
                    [ivarName isEqualToString:[@"_" stringByAppendingString:key]])
                {
                    // setValue:forKey: will work
                    [array addObject:key];
                }
                
                free(ivar);
            }
        }
        
        free(properties);
        subclass = subclass.superclass;
    }
    
    // Cache and return array
    objc_setAssociatedObject(self.class, _cmd, array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return array;
}

#pragma mark - Foundry methods
#pragma mark - Object lifecycle

- (id)init
{
    self = [super init];
    if (self)
    {
        self.id         = NSUUID.UUID.UUIDString;
        self._created   = NSDate.date;
        self._createdBy = nil;
        self._updated   = NSDate.date;
        self._updatedBy = nil;
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [self init];
    if (self)
    {
        // Loop through the properties
        for (NSString* key in self.class.propertyNames)
        {
            // Decode the property, and use the KVC setValueForKey: method to set it
            id  value = [aDecoder decodeObjectForKey:key];
            [self setValue:value
                    forKey:key];
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder*)aCoder
{
    // Loop through the properties
    for (NSString* key in self.class.propertyNames)
    {
        // Use the KVC valueForKey: method to get the property and then encode it
        id value = [self valueForKey:key];
        [aCoder encodeObject:value
                      forKey:key];
    }
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:self.class])
    {
        return NO;
    }
    
    return [self isEqualToBase:object];
}

- (BOOL)isEqualToBase:(DAOBase*)object
{
    if (![object.id isEqualToString:self.id])   {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOBase*)object
{
    self.id     = object.id;
    
    self._status        = object._status;
    self._statusError   = object._statusError;
    self._created       = object._created;
    self._createdBy     = object._createdBy;
    self._synced        = object._synced;
    self._updated       = object._updated;
    self._updatedBy     = object._updatedBy;
    
    return self;
}

- (id)copyWithZone:(NSZone*)zone
{
    typeof(self)    copy = [[self.class allocWithZone:zone] init];
    
    [copy updateWith:self];
    
    return copy;
}

- (void)set_status:(NSString*)status
{
    __status        = status;
    __statusError   = nil;
    
    if (!status ||
        !status.length ||
        [status isEqualToString:@"success"] ||
        [status isEqualToString:@"published"] ||
        [status isEqualToString:@"pending"])
    {
        return;
    }
    
    NSError*        jsonError = nil;
    
    NSData*         errorJson = [__status dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary*   errorData = [NSJSONSerialization JSONObjectWithData:errorJson
                                                                options:0
                                                                  error:&jsonError];
    
    NSString*   errorDomain         = errorData[@"domain"] ? errorData[@"domain"] : @"";
    NSInteger   errorCode           = ((NSString*)errorData[@"code"]).integerValue;
    NSString*   errorDescription    = errorData[NSLocalizedDescriptionKey] ? errorData[NSLocalizedDescriptionKey] : @"";
    NSString*   errorReason         = errorData[NSLocalizedFailureReasonErrorKey] ? errorData[NSLocalizedFailureReasonErrorKey] : @"";
    
    NSError*    cachedError  = [NSError errorWithDomain:errorDomain
                                                   code:errorCode
                                               userInfo:@{ NSLocalizedDescriptionKey: errorDescription,
                                                           NSLocalizedFailureReasonErrorKey: errorReason
                                                           }];
    
    __statusError   = cachedError;
}

- (void)set_statusError:(NSError*)statusError
{
    __statusError = statusError;
    
    if (!statusError)
    {
        if (!__status)
        {
            __status    = @"success";
        }
        return;
    }
    
    NSError*  jsonError = nil;
    
    NSString* errorDomain         = statusError.domain ? statusError.domain : @"";
    NSString* errorCode           = [NSString stringWithFormat:@"%ld", (long)statusError.code];
    NSString* errorDescription    = statusError.userInfo[NSLocalizedDescriptionKey] ? statusError.userInfo[NSLocalizedDescriptionKey] : @"";
    NSString* errorReason         = statusError.userInfo[NSLocalizedFailureReasonErrorKey] ? statusError.userInfo[NSLocalizedFailureReasonErrorKey] : @"";
    
    NSDictionary* errorData   = @{
                                  @"domain" : errorDomain,
                                  @"code" : errorCode,
                                  NSLocalizedDescriptionKey : errorDescription,
                                  NSLocalizedFailureReasonErrorKey : errorReason,
                                  };
    
    NSData*   errorJson       = [NSJSONSerialization dataWithJSONObject:errorData
                                                                options:0
                                                                  error:&jsonError];
    if (!errorJson || jsonError)
    {
        return;
    }
    
    NSString* errorJsonString = [[NSString alloc] initWithData:errorJson
                                                      encoding:NSUTF8StringEncoding];
    
    // This will be the json string in the preferred format
    errorJsonString = [errorJsonString stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
    
    self._status    = errorJsonString;
}

@end
