//
//  DAOUserNotificationSetting.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOUserNotificationSetting.h"

#import "DAOUser.h"

@implementation DAOUserNotificationSetting

#pragma mark - Object lifecycle

+ (instancetype)userNotificationSetting {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOUserNotificationSetting*)object
{
    return [[self.class.alloc init] updateWith:object];
}

- (id)init
{
    self = [super init];
    if (self)
    {
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[self class]])
    {
        return NO;
    }
    
    return [self isEqualToUserNotificationSetting:object];
}

- (BOOL)isEqualToUserNotificationSetting:(DAOUserNotificationSetting*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOUserNotificationSetting*)object
{
    [super updateWith:object];
    
    self.keycode        = object.keycode;
    
    self.emailEnabled   = object.emailEnabled;
    self.pushEnabled    = object.pushEnabled;
    self.smsEnabled     = object.smsEnabled;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;
    
    return object;
}

@end
