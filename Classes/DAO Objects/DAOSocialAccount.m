//
//  DAOSocialAccount.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOSocialAccount.h"

#import "DAOLocation.h"
#import "DAOUser.h"

@implementation DAOSocialAccount

#pragma mark - Object lifecycle

+ (instancetype)socialAccount   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOSocialAccount*)object
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
    if (![object isKindOfClass:self.class])
    {
        return NO;
    }
    
    return [self isEqualToSocialAccount:object];
}

- (BOOL)isEqualToSocialAccount:(DAOSocialAccount*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }

    return YES;
}

- (id)updateWith:(DAOSocialAccount*)object
{
    [super updateWith:object];
    
    self.type       = object.type;
    self.handle     = object.handle;
    self.url        = object.url;
    
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
