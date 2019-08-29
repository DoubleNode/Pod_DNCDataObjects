//
//  DAOOrderSection.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOOrderSection.h"

#import "DAOCategory.h"
#import "DAOItem.h"
#import "DAOLineitem.h"
#import "DAOLocation.h"
#import "DAOOrder.h"
#import "DAOUser.h"

@implementation DAOOrderSection

+ (instancetype)orderSection    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOOrderSection*)object
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
    
    return [self isEqualToOrderSection:object];
}

- (BOOL)isEqualToOrderSection:(DAOOrderSection*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOOrderSection*)object
{
    [super updateWith:object];
    
    if (object.order || (object.orderId && ![self.orderId isEqualToString:object.orderId]))
    {
        self.order   = object.order;
    }
    self.orderId = object.orderId;
    
    self.name       = object.name;
    self.total      = object.total;
    self.data       = object.data;
    
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
    
    self.lineitems      = object.lineitems;

    return object;
}

@end
