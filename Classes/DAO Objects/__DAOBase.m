//
//  __DAOBase.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@implementation DAOBase

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

+ (NSDateFormatter*)defaultDateFormatter1
{
    static dispatch_once_t  onceToken;
    static NSDateFormatter* dateFormatter;
    
    dispatch_once(&onceToken,
                  ^()
                  {
                      dateFormatter = [NSDateFormatter.alloc init];
                      [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
                      [dateFormatter setDateFormat:@"yyyy-MM-dd"];
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
                      [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
                      [dateFormatter setDateFormat:@"MM/dd/yyyy"];
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
                      [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
                      [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'"];
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
                      [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
                      [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"];
                  });
    
    return dateFormatter;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.id         = [[NSUUID UUID] UUIDString];
        self._created   = [NSDate date];
        self._createdBy = nil;
        self._updated   = [NSDate date];
        self._updatedBy = nil;
    }
    
    return self;
}

- (BOOL)boolFromString:(NSString*)string
{
    if (![string isKindOfClass:NSString.class])
    {
        return NO;
    }
    
    if (!string || ![string isKindOfClass:NSString.class] || [string isEqualToString:@"<null>"])
    {
        return NO;
    }
    
    if (!string)
    {
        return NO;
    }
    
    if (!string.length)
    {
        return NO;
    }
    
    return ([[string substringToIndex:1] isEqualToString:@"Y"] || [[string substringToIndex:1] isEqualToString:@"1"]);
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
    
    if (!string || ![string isKindOfClass:NSString.class] || [string isEqualToString:@"<null>"])
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
    
    if (!number || ![number isKindOfClass:NSNumber.class])
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
    NSNumberFormatter* theNumberFormatter = numberFormatter;
    if (!theNumberFormatter)
    {
        theNumberFormatter = self.class.defaultNumberFormatter;
    }
    
    if ([string isKindOfClass:NSNumber.class])
    {
        return (NSNumber*)string;
    }
    
    if (!string || ![string isKindOfClass:NSString.class] || [string isEqualToString:@"<null>"])
    {
        return @0;
    }
    
    return [theNumberFormatter numberFromString:string];
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
    
    if (!string || ![string isKindOfClass:NSString.class] || [string isEqualToString:@"<null>"])
    {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@", string];
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
        
        return [self.class.firebaseTimeFormatter dateFromString:dateString];
    }

    double  unixDate    = [[self numberFromString:string] doubleValue];
    
    return [NSDate dateWithTimeIntervalSince1970:unixDate];
}

- (NSString*)urlFromString:(NSString*)string
{
    if ([string isKindOfClass:NSString.class])
    {
        return string;
    }
    
    if (!string || ![string isKindOfClass:NSString.class] || [string isEqualToString:@"<null>"])
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
    if (![object.id isEqualToString:self.id])               {   return NO;  }
    
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
    
    if (!status || !status.length || [status isEqualToString:@"success"] || [status isEqualToString:@"published"] || [status isEqualToString:@"pending"])
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
