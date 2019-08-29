//
//  DAOUser.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOUser.h"

@implementation DAOUser

#pragma mark - Object lifecycle

+ (instancetype)user    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOUser*)object
{
    return [[self.class.alloc init] updateWith:object];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.ratingTypes    = [@{ } mutableCopy];
        self.optionIds      = [@{ } mutableCopy];
        self.options        = [@{ } mutableCopy];
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[self class]])
    {
        return NO;
    }
    
    return [self isEqualToUser:object];
}

- (BOOL)isEqualToUser:(DAOUser*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOUser*)object
{
    [super updateWith:object];
    
    self.name           = object.name;
    self.extUserID      = object.extUserID;
    self.email          = object.email;
    
    self.authSessionId  = object.authSessionId;
    self.authToken      = object.authToken;
    self.authData       = object.authData;
    self.authType       = object.authType;
    self.username       = object.username;
    self.password       = object.password;
    self.security       = object.security;
    
    self.verifyKey      = object.verifyKey;
    self.verifiedDate   = object.verifiedDate;
    
    if (object.avatar || (object.avatarId && ![self.avatarId isEqualToString:object.avatarId]))
    {
        self.avatar     = object.avatar;
    }
    self.avatarId       = object.avatarId;
    
    if (object.contact || (object.contactId && ![self.contactId isEqualToString:object.contactId]))
    {
        self.contact    = object.contact;
    }
    self.contactId      = object.contactId;
    
    self.phoneNumber    = object.phoneNumber;
    self.handle         = object.handle;
    self.birthday       = object.birthday;
    self.location       = object.location;
    self.rating         = object.rating;
    self.ratingTypes    = object.ratingTypes;
    
    self.me             = object.me;
    
    self.numUsersFollowers      = object.numUsersFollowers;
    self.numUsersFollowing      = object.numUsersFollowing;
    
    self.numLocationsFollowers  = object.numLocationsFollowers;
    self.numLocationsRatings    = object.numLocationsRatings;
    self.numLocationsReviews    = object.numLocationsReviews;
    self.numLocationsFavorites  = object.numLocationsFavorites;
    self.numLocationsWishlists  = object.numLocationsWishlists;
    self.numLocationsCheckins   = object.numLocationsCheckins;
    
    self.numItemsFollowers      = object.numItemsFollowers;
    self.numItemsRatings        = object.numItemsRatings;
    self.numItemsReviews        = object.numItemsReviews;
    self.numItemsFavorites      = object.numItemsFavorites;
    self.numItemsWishlists      = object.numItemsWishlists;
    self.numItemsCheckins       = object.numItemsCheckins;
    
    self.optionIds      = [object.optionIds mutableCopy];
    self.options        = [object.options mutableCopy];
    
    self.myFollow       = object.myFollow;
    
    if (object.categories || ![self.id isEqualToString:object.id])
    {
        self.categories  = object.categories;
    }
    if (object.contacts || ![self.id isEqualToString:object.id])
    {
        self.contacts   = object.contacts;
    }
    if (object.favorites || ![self.id isEqualToString:object.id])
    {
        self.favorites  = object.favorites;
    }
    if (object.items || ![self.id isEqualToString:object.id])
    {
        self.items  = object.items;
    }
    if (object.locations || ![self.id isEqualToString:object.id])
    {
        self.locations  = object.locations;
    }
    if (object.wishlists || ![self.id isEqualToString:object.id])
    {
        self.wishlists  = object.wishlists;
    }

    if (object.devices || ![self.id isEqualToString:object.id])
    {
        self.devices  = object.devices;
    }
    
    return self;
}

@end
