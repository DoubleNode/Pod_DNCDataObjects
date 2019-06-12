//
//  __DAOBase.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
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

+ (NSNumberFormatter* _Nonnull)defaultNumberFormatter
{
    static dispatch_once_t predicate;
    static NSNumberFormatter* defaultNumberFormatter = nil;
    dispatch_once(&predicate, ^
                  {
                      defaultNumberFormatter                = [[NSNumberFormatter alloc] init];
                      defaultNumberFormatter.numberStyle    = NSNumberFormatterDecimalStyle;
                  });
    return defaultNumberFormatter;
}

+ (NSNumberFormatter* _Nonnull)defaultCurrencyFormatter
{
    static dispatch_once_t predicate;
    static NSNumberFormatter* defaultCurrencyFormatter = nil;
    dispatch_once(&predicate, ^
                  {
                      defaultCurrencyFormatter              = [[NSNumberFormatter alloc] init];
                      defaultCurrencyFormatter.numberStyle  = NSNumberFormatterCurrencyStyle;
                  });
    return defaultCurrencyFormatter;
}

+ (NSDateFormatter*)defaultDateFormatter1
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"yyyy-MM-dd";
                  });
    
    return dateFormatter;
}

+ (NSDateFormatter*)defaultDateFormatter2
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"MM/dd/yyyy";
                  });
    
    return dateFormatter;
}

+ (NSDateFormatter*)firebaseDateFormatter
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"yyyy'-'MM'-'dd'";
                  });
    
    return dateFormatter;
}

+ (NSDateFormatter*)firebaseTimeFormatterMilliseconds
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZ";
                  });
    
    return dateFormatter;
}

+ (NSDateFormatter*)firebaseTimeFormatter
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"yyyy'-'MM'-'dd'T'HH':'mm':'ssZ";
                  });
    
    return dateFormatter;
}

+ (NSDateFormatter*)localTimeFormatterMillisecondsWithoutTimezone
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS";
                  });
    
    return dateFormatter;
}

+ (NSDateFormatter*)localTimeFormatterMilliseconds
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZ";
                  });
    
    return dateFormatter;
}

+ (NSDateFormatter*)localTimeFormatterWithoutTimezone
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss";
                  });
    
    return dateFormatter;
}

+ (NSDateFormatter*)localTimeFormatter
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      dateFormatter.timeZone    = NSTimeZone.localTimeZone; // [NSTimeZone timeZoneWithName:@"GMT"]
                      dateFormatter.dateFormat  = @"yyyy'-'MM'-'dd'T'HH':'mm':'ssZ";
                  });
    
    return dateFormatter;
}

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

- (BOOL)boolFromString:(NSString*)string
{
    if ([string isKindOfClass:NSNumber.class])
    {
        string = [NSString stringWithFormat:@"%@", string];
    }
    
    if (!string ||
        ![string isKindOfClass:NSString.class] ||
        [string isEqualToString:@"<null>"])
    {
        return NO;
    }
    
    if (!string.length)
    {
        return NO;
    }
    
    return ([[string substringToIndex:1] isEqualToString:@"Y"] ||
            [[string substringToIndex:1] isEqualToString:@"1"]);
}

- (NSDate*)dateFromNumber:(NSNumber*)number
{
    if ([number isKindOfClass:NSNull.class])
    {
        return nil;
    }
    
    if ([number isKindOfClass:NSDate.class])
    {
        return (NSDate*)number;
    }
    
    return [NSDate dateWithTimeIntervalSinceReferenceDate:number.doubleValue];
}

- (NSDate*)dateFromString:(NSString*)string
{
    if ([string isKindOfClass:NSNull.class])
    {
        return nil;
    }
    
    if ([string isKindOfClass:NSDate.class])
    {
        return (NSDate*)string;
    }
    
    if ([string isKindOfClass:NSDictionary.class])
    {
        // Support for Firebase Date format
        NSDictionary*   dictionary  = (NSDictionary*)string;
        NSString*       dateString  = dictionary[@"iso"];
        if (![dateString isKindOfClass:NSString.class])
        {
            return nil;
        }
        if (!dateString.length)
        {
            return nil;
        }
        
        return [self.class.firebaseDateFormatter dateFromString:dateString];
    }
    
    NSString*   dateString  = [self stringFromString:string];
    
    NSDate* retval = [self.class.defaultDateFormatter1 dateFromString:dateString];
    if (!retval)
    {
        retval = [self.class.defaultDateFormatter2 dateFromString:dateString];
    }
    
    return retval;
}

- (NSString*)idFromString:(NSString*)string
{
    if ([string isKindOfClass:NSString.class])
    {
        return string;
    }
    
    if (!string ||
        ![string isKindOfClass:NSString.class] ||
        [string isEqualToString:@"<null>"])
    {
        return nil;
    }
    
    return [NSString stringWithFormat:@"%@", string];
}

- (NSNumber*)numberFromNumber:(NSNumber*)number
{
    if ([number isKindOfClass:NSNumber.class])
    {
        return (NSNumber*)number;
    }
    
    if (!number)
    {
        return @0;
    }
    
    return @0;
}

- (NSNumber*)numberFromString:(NSString*)string
{
    return [self numberFromString:string usingFormatter:nil];
}

- (NSNumber*)numberFromString:(NSString*)string
               usingFormatter:(NSNumberFormatter*)numberFormatter
{
    if ([string isKindOfClass:NSNumber.class])
    {
        return (NSNumber*)string;
    }
    
    NSNumberFormatter* theNumberFormatter = numberFormatter;
    if (!theNumberFormatter)
    {
        theNumberFormatter = self.class.defaultNumberFormatter;
    }
    
    if (!string ||
        ![string isKindOfClass:NSString.class] ||
        [string isEqualToString:@"<null>"])
    {
        return @0;
    }
    
    return [theNumberFormatter numberFromString:string];
}

- (NSDecimalNumber*)decimalNumberFromNumber:(NSNumber*)number
{
    if ([number isKindOfClass:NSDecimalNumber.class])
    {
        return (NSDecimalNumber*)number;
    }
    
    if (!number)
    {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    return [NSDecimalNumber decimalNumberWithString:@"0"];
}

- (NSDecimalNumber*)decimalNumberFromString:(NSString*)string
{
    return [self decimalNumberFromString:string];
}

- (NSDecimalNumber*)decimalNumberFromString:(NSString*)string
                             usingFormatter:(NSNumberFormatter*)numberFormatter
{
    if ([string isKindOfClass:NSDecimalNumber.class])
    {
        return (NSDecimalNumber*)string;
    }
    
    NSNumberFormatter* theNumberFormatter = numberFormatter;
    if (!theNumberFormatter)
    {
        theNumberFormatter = self.class.defaultNumberFormatter;
    }
    
    if (!string ||
        ![string isKindOfClass:NSString.class] ||
        [string isEqualToString:@"<null>"])
    {
        return [self decimalNumberFromString:string];
    }
    
    return (NSDecimalNumber*)[theNumberFormatter numberFromString:string];
}

- (int)intFromNumber:(NSNumber*)number
{
    NSNumber*   retval = [self numberFromNumber:number];
    
    return retval.intValue;
}

- (int)intFromString:(NSString*)string
{
    NSNumber*   retval = [self numberFromString:string];
    
    return retval.intValue;
}

- (int)intFromString:(NSString*)string
      usingFormatter:(NSNumberFormatter*)numberFormatter
{
    NSNumber*   retval = [self numberFromString:string
                                 usingFormatter:numberFormatter];
    
    return retval.intValue;
}

- (NSString*)stringFromFirebaseDate:(NSDate*)date
{
    if ([date isKindOfClass:NSString.class])
    {
        return (NSString*)date;
    }
    
    if (!date ||
        ![date isKindOfClass:NSDate.class])
    {
        return @"";
    }
    
    return [self.class.firebaseDateFormatter stringFromDate:date];
}

- (NSString*)stringFromFirebaseTime:(NSDate*)time
{
    if ([time isKindOfClass:NSString.class])
    {
        return (NSString*)time;
    }
    
    if (!time ||
        ![time isKindOfClass:NSDate.class])
    {
        return @"";
    }
    
    return [self.class.firebaseTimeFormatterMilliseconds stringFromDate:time];
}

- (NSString*)stringFromLocalTime:(NSDate*)time
{
    return [self stringFromLocalTime:time
                        withTimezone:NO];
}

- (NSString*)stringFromLocalTimeWithTimezone:(NSDate*)time
{
    return [self stringFromLocalTime:time
                        withTimezone:YES];
}

- (NSString*)stringFromLocalTime:(NSDate*)time
                    withTimezone:(BOOL)withTimezone
{
    if ([time isKindOfClass:NSString.class])
    {
        return (NSString*)time;
    }
    
    if (!time ||
        ![time isKindOfClass:NSDate.class])
    {
        return @"";
    }
    
    if (!withTimezone)
    {
        return [self.class.localTimeFormatterWithoutTimezone stringFromDate:time];
    }
    
    return [self.class.localTimeFormatterMilliseconds stringFromDate:time];
}

- (NSString*)stringFromString:(NSString*)string
{
    if ([string isKindOfClass:NSDictionary.class])
    {
        NSData* jsonData    = [NSJSONSerialization dataWithJSONObject:string
                                                              options:0
                                                                error:nil];
        
        string = [NSString.alloc initWithData:jsonData
                                     encoding:NSUTF8StringEncoding];
    }
    
    if ([string isKindOfClass:NSString.class])
    {
        return string;
    }
    
    if (!string ||
        ![string isKindOfClass:NSString.class] ||
        [string isEqualToString:@"<null>"])
    {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@", string];
}

- (NSString*)santizeKeyForFirebase:(NSString*)keyString
{
    NSString*   kInvalidKeyCharacters = @"[].#$/";
    
    NSCharacterSet* invalidCharSet = [NSCharacterSet characterSetWithCharactersInString:kInvalidKeyCharacters];
    
    return [[keyString componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@"_"];
}

- (NSDate*)timeFromString:(NSString*)string
{
    if ([string isKindOfClass:NSNull.class])
    {
        return nil;
    }
    
    if ([string isKindOfClass:NSDate.class])
    {
        return (NSDate*)string;
    }
    
    if ([string isKindOfClass:NSDictionary.class])
    {
        // Support for Firebase Date format
        NSDictionary*   dictionary  = (NSDictionary*)string;
        NSString*       dateString  = dictionary[@"iso"];
        if (![dateString isKindOfClass:NSString.class])
        {
            return nil;
        }
        if (!dateString.length)
        {
            return nil;
        }
        
        return [self.class.firebaseTimeFormatterMilliseconds dateFromString:dateString];
    }
    
    if (string.length)
    {
        id  numberValue = [self numberFromString:string];
        if (numberValue)
        {
            double  unixDate    = [numberValue doubleValue];
            
            return [NSDate dateWithTimeIntervalSince1970:unixDate];
        }
    }
    
    NSString*   timeString  = [self stringFromString:string];
    
    NSDate* retval = [self.class.firebaseTimeFormatterMilliseconds dateFromString:timeString];
    if (!retval)
    {
        retval = [self.class.firebaseTimeFormatter dateFromString:timeString];
    }
    if (!retval)
    {
        retval = [self.class.defaultDateFormatter1 dateFromString:timeString];
    }
    if (!retval)
    {
        retval = [self.class.defaultDateFormatter2 dateFromString:timeString];
    }
    if (!retval)
    {
        retval = [self.class.localTimeFormatterWithoutTimezone dateFromString:timeString];
    }
    
    return retval;
}

- (NSURL*)urlFromString:(NSString*)string
{
    NSString*   urlString = [self urlStringFromString:string];
    if (!urlString.length)
    {
        return [NSURL.alloc init];
    }
    
    return [NSURL URLWithString:urlString];
}

- (NSString*)urlStringFromString:(NSString*)string
{
    if ([string isKindOfClass:NSString.class])
    {
        return string;
    }
    
    if (!string ||
        ![string isKindOfClass:NSString.class] ||
        [string isEqualToString:@"<null>"])
    {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@", string];
}

- (NSMutableArray*)arrayFromJsonString:(NSString*)string
{
    if (![string isKindOfClass:NSString.class])
    {
        return NSMutableArray.array;
    }
    
    NSError*    jsonError   = nil;
    NSData*     jsonData    = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableArray*    retval  = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                 options:0
                                                                   error:&jsonError];
    if (!retval || jsonError)
    {
        return NSMutableArray.array;
    }
    if ([retval isKindOfClass:NSArray.class])
    {
        return @[ retval ].mutableCopy;
    }
    if (![retval isKindOfClass:NSArray.class])
    {
        return NSMutableArray.array;
    }
    
    if (![retval isKindOfClass:NSMutableArray.class])
    {
        retval = retval.mutableCopy;
    }
    
    return retval;
}

- (NSMutableDictionary*)dictionaryFromJsonString:(NSString*)string
{
    if (![string isKindOfClass:NSString.class])
    {
        return NSMutableDictionary.dictionary;
    }
    
    NSError*    jsonError   = nil;
    NSData*     jsonData    = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary*    retval  = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                      options:0
                                                                        error:&jsonError];
    if (!retval || jsonError)
    {
        return NSMutableDictionary.dictionary;
    }
    if ([retval isKindOfClass:NSArray.class])
    {
        return @{ @"array" : retval }.mutableCopy;
    }
    if (![retval isKindOfClass:NSDictionary.class])
    {
        return NSMutableDictionary.dictionary;
    }
    
    if (![retval isKindOfClass:NSMutableDictionary.class])
    {
        retval = retval.mutableCopy;
    }
    
    return retval;
}

- (NSString*)jsonStringFromArray:(NSArray*)array
{
    if ([array isKindOfClass:NSString.class])
    {
        return (NSString*)array;
    }
    if (![array isKindOfClass:NSArray.class])
    {
        return @"";
    }
    
    NSError*    jsonError   = nil;
    NSData*     jsonData    = [NSJSONSerialization dataWithJSONObject:array
                                                              options:0
                                                                error:&jsonError];
    if (!jsonData || jsonError)
    {
        return @"";
    }
    
    return [NSString.alloc initWithData:jsonData
                               encoding:NSUTF8StringEncoding];
}

- (NSString*)jsonStringFromDictionary:(NSDictionary*)dictionary;
{
    if ([dictionary isKindOfClass:NSString.class])
    {
        return (NSString*)dictionary;
    }
    if (![dictionary isKindOfClass:NSDictionary.class])
    {
        return @"";
    }
    
    NSError*    jsonError   = nil;
    NSData*     jsonData    = [NSJSONSerialization dataWithJSONObject:dictionary
                                                              options:0
                                                                error:&jsonError];
    if (!jsonData || jsonError)
    {
        return @"";
    }
    
    return [NSString.alloc initWithData:jsonData
                               encoding:NSUTF8StringEncoding];
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
