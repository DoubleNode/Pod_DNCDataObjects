//
//  DAOTransaction.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOTransaction.h"

#import "DAOCategory.h"
#import "DAOContact.h"
#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOOrder.h"
#import "DAOPaymentAccount.h"
#import "DAOUser.h"

@implementation DAOTransaction

+ (instancetype)transaction {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOTransaction*)object
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
    
    return [self isEqualToTransaction:object];
}

- (BOOL)isEqualToTransaction:(DAOTransaction*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOTransaction*)object
{
    [super updateWith:object];
    
    self.order          = object.order;
    self.contact        = object.contact;
    self.paymentAccount = object.paymentAccount;
    
    self.type               = object.type;
    self.status             = object.status;
    self.authorizationCode  = object.authorizationCode;
    self.discountCode       = object.discountCode;
    
    self.subtotal   = object.subtotal;
    self.discount   = object.discount;
    self.tax        = object.tax;
    self.total      = object.total;
    
    self.paymentType    = object.paymentType;
    self.paymentData    = object.paymentData;
    
    self.holdUntil      = object.holdUntil;
    self.cancelAfter    = object.cancelAfter;
    self.charged        = object.charged;
    self.captured       = object.captured;
    
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
