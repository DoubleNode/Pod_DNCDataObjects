//
//  DAOFollow.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOFollow.h"

#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOUser.h"

@implementation DAOFollow

+ (instancetype)follow   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOFollow*)object
{
    return [[self.class.alloc init] updateWith:object];
}

#pragma mark - Object lifecycle

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
    if (![super isEqual:object])
    {
        return NO;
    }
    
    return [self isEqualToFollow:object];
}

- (BOOL)isEqualToFollow:(DAOFollow*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.user2Id isEqualToString:self.user2Id])         {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOFollow*)object
{
    [super updateWith:object];
    
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
    
    if (object.user2 || (object.user2Id && ![self.user2Id isEqualToString:object.user2Id]))
    {
        self.user2   = object.user2;
    }
    self.user2Id = object.user2Id;
    
    return self;
}

@end
