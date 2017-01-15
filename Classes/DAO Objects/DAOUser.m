//
//  DAOUser.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOUser.h"

#import "DAOFavorite.h"
#import "DAOFollow.h"
#import "DAOPhoto.h"
#import "DAOUserDevice.h"
#import "DAOWishlist.h"

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
        self.optionIds  = [@{ } mutableCopy];
        self.options    = [@{ } mutableCopy];
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
    
    self.authSessionId  = object.authSessionId;
    self.authToken      = object.authToken;
    self.authData       = object.authData;
    self.authType       = object.authType;
    self.username       = object.username;
    self.password       = object.password;
    
    if (object.avatar || (object.avatarId && ![self.avatarId isEqualToString:object.avatarId]))
    {
        self.avatar         = object.avatar;
    }
    self.avatarId       = object.avatarId;
    
    self.phoneNumber    = object.phoneNumber;
    self.handle         = object.handle;
    self.birthday       = object.birthday;
    self.location       = object.location;
    
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
    
    if (object.favorites || ![self.id isEqualToString:object.id])
    {
        self.favorites  = object.favorites;
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
