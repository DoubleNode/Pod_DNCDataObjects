//
//  DAOTransmission.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOTransmission.h"

#import "DAONotification.h"
#import "DAOUser.h"

@implementation DAOTransmission

+ (instancetype)transmission    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOTransmission*)object
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
    
    return [self isEqualToTransmission:object];
}

- (BOOL)isEqualToTransmission:(DAOTransmission*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOTransmission*)object
{
    [super updateWith:object];
    
    self.to     = object.to;
    self.body   = object.body;
    
    self.sent   = object.sent;
    self.read   = object.read;
    
    self.notificationId  = object.notificationId;
    self.notification    = object.notification;
    
    self.userId     = object.userId;
    self.user       = object.user;
    
    return object;
}

@end
