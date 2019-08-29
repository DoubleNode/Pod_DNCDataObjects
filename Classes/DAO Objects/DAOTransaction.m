//
//  DAOTransaction.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
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
    
    if (object.order || (object.orderId && ![self.orderId isEqualToString:object.orderId]))
    {
        self.order   = object.order;
    }
    self.orderId = object.orderId;

    if (object.contact || (object.contactId && ![self.contactId isEqualToString:object.contactId]))
    {
        self.contact   = object.contact;
    }
    self.contactId = object.contactId;
    
    if (object.paymentAccount || (object.paymentAccountId && ![self.paymentAccountId isEqualToString:object.paymentAccountId]))
    {
        self.paymentAccount   = object.paymentAccount;
    }
    self.paymentAccountId = object.paymentAccountId;
    
    self.type               = object.type;
    self.status             = object.status;
    self.authorizationCode  = object.authorizationCode;
    self.discountCode       = object.discountCode;
    
    self.subtotal   = object.subtotal;
    self.discount   = object.discount;
    self.tax        = object.tax;
    self.total      = object.total;
    self.data       = object.data;
    
    self.paymentType    = object.paymentType;
    self.paymentData    = object.paymentData;
    
    self.chargeAfter    = object.chargeAfter;
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
