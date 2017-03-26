//
//  DAOPaymentAccount.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOPaymentAccount.h"

#import "DAOContact.h"
#import "DAOUser.h"

@implementation DAOPaymentAccount

+ (instancetype)paymentAccount  {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOPaymentAccount*)object
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
    
    return [self isEqualToPaymentAccount:object];
}

- (BOOL)isEqualToPaymentAccount:(DAOPaymentAccount*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOPaymentAccount*)object
{
    [super updateWith:object];
    
    self.type           = object.type;
    self.name           = object.name;
    self.accountNumber  = object.accountNumber;
    self.expirationDate = object.expirationDate;
    self.cvv            = object.cvv;
    
    self.contactId  = object.contactId;
    self.contact    = object.contact;
    
    self.userId     = object.userId;
    self.user       = object.user;
    
    return object;
}

@end
