//
//  DAONotification.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAONotification.h"

#import "DAOUser.h"

@implementation DAONotification

+ (instancetype)notification    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAONotification*)object
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
    
    return [self isEqualToNotification:object];
}

- (BOOL)isEqualToNotification:(DAONotification*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAONotification*)object
{
    [super updateWith:object];
    
    self.type   = object.type;
    self.data   = object.data;

    self.userId     = object.userId;
    self.user       = object.user;
    
    return object;
}

@end
