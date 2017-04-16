//
//  DAOLineitem.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOLineitem.h"

#import "DAOCategory.h"
#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOOrder.h"
#import "DAOUser.h"

@implementation DAOLineitem

+ (instancetype)lineitem    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOLineitem*)object
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
    
    return [self isEqualToLineitem:object];
}

- (BOOL)isEqualToLineitem:(DAOLineitem*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOLineitem*)object
{
    [super updateWith:object];
    
    self.order      = object.order;
    self.name       = object.name;
    self.quantity   = object.quantity;
    self.price      = object.price;
    self.total      = object.total;
    
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