//
//  DAOCheckin.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOCheckin.h"

#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOPhoto.h"
#import "DAOUser.h"

@implementation DAOCheckin

#pragma mark - Object lifecycle

+ (instancetype)checkin   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOCheckin*)object
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
    if (![super isEqual:object])
    {
        return NO;
    }
    
    return [self isEqualToCheckin:object];
}

- (BOOL)isEqualToCheckin:(DAOCheckin*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.photoId isEqualToString:self.photoId])         {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOCheckin*)object
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
    
    if (object.photo || (object.photoId && ![self.photoId isEqualToString:object.photoId]))
    {
        self.photo  = object.photo;
    }
    self.photoId    = object.photoId;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;
    
    return self;
}

@end
