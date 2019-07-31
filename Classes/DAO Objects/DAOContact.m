//
//  DAOContact.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOContact.h"

#import "DAOUser.h"

@implementation DAOContact

+ (instancetype)contact {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOContact*)object
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
    
    return [self isEqualToContact:object];
}

- (BOOL)isEqualToContact:(DAOContact*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOContact*)object
{
    [super updateWith:object];
    
    self.type       = object.type;
    self.name       = object.name;
    self.email      = object.email;
    self.phone      = object.phone;
    self.address    = object.address;
    self.address2   = object.address2;
    self.city       = object.city;
    self.state      = object.state;
    self.postalCode = object.postalCode;
    self.country    = object.country;
    self.geohash    = object.geohash;
    self.latitude   = object.latitude;
    self.longitude  = object.longitude;
    
    self.verificationDate   = object.verificationDate;
    
    self.primary    = object.primary;
    self.verified   = object.verified;
    
    self.userId     = object.userId;
    self.user       = object.user;
    
    return object;
}

@end
