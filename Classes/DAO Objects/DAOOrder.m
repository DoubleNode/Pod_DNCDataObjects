//
//  DAOOrder.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOOrder.h"

#import "DAOCategory.h"
#import "DAOItem.h"
#import "DAOLineitem.h"
#import "DAOLocation.h"
#import "DAOTransaction.h"
#import "DAOUser.h"

@implementation DAOOrder

+ (instancetype)order   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOOrder*)object
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
    
    return [self isEqualToOrder:object];
}

- (BOOL)isEqualToOrder:(DAOOrder*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOOrder*)object
{
    [super updateWith:object];
    
    self.status     = object.status;
    self.state      = object.state;
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
    
    self.lineitems      = object.lineitems;
    self.transactions   = object.transactions;

    return object;
}

@end
