//
//  DAOUserDevice.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOUserDevice.h"

#import "DAOUser.h"

@implementation DAOUserDevice

#pragma mark - Object lifecycle

+ (instancetype)userDevice  {   return [[[self class] alloc] init]; }

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
    
    return [self isEqualToUserDevice:object];
}

- (BOOL)isEqualToUserDevice:(DAOUserDevice*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)copyWithZone:(NSZone*)zone
{
    typeof(self)    copy = [super copyWithZone:zone];
    
    if (self.user || ![copy.userId isEqualToString:self.userId])
    {
        copy.user  = self.user;
    }
    copy.userId  = self.userId;
    
    copy.deviceId       = self.deviceId;
    copy.deviceType     = self.deviceType;
    
    copy.userId         = self.userId;
    copy.user           = self.user;
    
    return copy;
}

@end
