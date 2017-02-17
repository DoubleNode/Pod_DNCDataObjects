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
    if (![string isKindOfClass:[NSString class]])
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
    
    return [[string substringToIndex:1] isEqualToString:@"Y"];
}

- (NSDate*)dateFromString:(NSString*)string
{
    if ([string isKindOfClass:[NSDate class]])
    {
        return (NSDate*)string;
    }
    
    NSString*   dateString  = [self stringFromString:string];
    
    NSDateFormatter*   dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    return [dateFormatter dateFromString:dateString];
}

- (NSString*)idFromString:(NSString*)string
{
    if ([string isKindOfClass:[NSString class]])
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
    
    if ([string isKindOfClass:[NSNumber class]])
    {
        return (NSNumber*)string;
    }
    
    if (!string || ![string isKindOfClass:NSString.class] || [string isEqualToString:@"<null>"])
    {
        return @0;
    }
    
    return [theNumberFormatter numberFromString:string];
}

- (NSString*)stringFromString:(NSString*)string
{
    if ([string isKindOfClass:[NSString class]])
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
    if ([string isKindOfClass:[NSDate class]])
    {
        return (NSDate*)string;
    }
    
    double  unixDate    = [[self numberFromString:string] doubleValue];
    
    return [NSDate dateWithTimeIntervalSince1970:unixDate];
}

- (NSString*)urlFromString:(NSString*)string
{
    if ([string isKindOfClass:[NSString class]])
    {
        return string;
    }
    
    if (!string || ![string isKindOfClass:NSString.class] || [string isEqualToString:@"<null>"])
    {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@", string];
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[self class]])
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
    typeof(self)    copy = [[[self class] allocWithZone:zone] init];
    
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
