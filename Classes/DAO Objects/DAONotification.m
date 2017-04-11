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
    
    self.key            = object.key;
    self.data           = object.data;
    self.disposition    = object.disposition;
    
    if (object.category || (object.categoryId && ![self.categoryId isEqualToString:object.categoryId]))
    {
        self.category   = object.category;
    }
    self.categoryId = object.categoryId;
    
    if (object.item || (object.itemId && ![self.itemId isEqualToString:object.itemId]))
    {
        self.item   = object.item;
    }
    self.itemId = object.itemId;
    
    if (object.location || (object.locationId && ![self.locationId isEqualToString:object.locationId]))
    {
        self.location   = object.location;
    }
    self.locationId = object.locationId;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;
    
    return object;
}

@end
