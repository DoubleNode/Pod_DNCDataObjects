//
//  DAOLocation.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOLocation.h"

#import "DAOItem.h"
#import "DAOPhoto.h"

@implementation DAOLocation

+ (instancetype)location    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOLocation*)object
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
    
    return [self isEqualToLocation:object];
}

- (BOOL)isEqualToLocation:(DAOLocation*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOLocation*)object
{
    [super updateWith:object];
    
    self.externalId         = object.externalId;
    self.name               = object.name;
    self.type               = object.type;
    self.descriptionString  = object.descriptionString;
    self.security           = object.security;
    
    self.website            = object.website;
    self.established        = object.established;
    self.mailingListURL     = object.mailingListURL;
    self.rating             = object.rating;
    self.ratingTypes        = object.ratingTypes;
    self.defaultPhoto       = object.defaultPhoto;

    self.phone              = object.phone;
    self.address            = object.address;
    self.address2           = object.address2;
    self.city               = object.city;
    self.state              = object.state;
    self.postalCode         = object.postalCode;
    self.country            = object.country;
    self.geohash            = object.geohash;
    self.latitude           = object.latitude;
    self.longitude          = object.longitude;
    
    self.followingFlag      = object.followingFlag;
    
    self.numCheckins        = object.numCheckins;
    self.numFavorites       = object.numFavorites;
    self.numFollowers       = object.numFollowers;
    self.numRatings         = object.numRatings;
    self.numReviews         = object.numReviews;
    self.numWishlists       = object.numWishlists;
    
    self.optionIds      = [object.optionIds mutableCopy];
    self.options        = [object.options mutableCopy];
    
    if (object.categories || ![self.id isEqualToString:object.id])
    {
        self.categories  = object.categories;
    }
    if (object.favorites || ![self.id isEqualToString:object.id])
    {
        self.favorites  = object.favorites;
    }
    if (object.items || ![self.id isEqualToString:object.id])
    {
        self.items  = object.items;
    }
    if (object.photos || ![self.id isEqualToString:object.id])
    {
        self.photos  = object.photos;
    }
    if (object.wishlists || ![self.id isEqualToString:object.id])
    {
        self.wishlists  = object.wishlists;
    }

    if (object.socialAccounts || ![self.id isEqualToString:object.id])
    {
        self.socialAccounts  = object.socialAccounts;
    }
    
    return self;
}

@end
