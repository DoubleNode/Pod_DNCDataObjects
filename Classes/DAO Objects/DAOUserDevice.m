//
//  DAOUserDevice.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOUserDevice.h"

#import "DAOUser.h"

@implementation DAOUserDevice

#pragma mark - Object lifecycle

+ (instancetype)userDevice  {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOUserDevice*)object
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
    
    return [self isEqualToUserDevice:object];
}

- (BOOL)isEqualToUserDevice:(DAOUserDevice*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOUserDevice*)object
{
    [super updateWith:object];
    
    self.deviceId       = object.deviceId;
    self.deviceType     = object.deviceType;
    self.serviceId      = object.serviceId;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;
    
    return object;
}

@end
