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

+ (instancetype)location    {   return [[self.class alloc] init]; }

+ (instancetype)copyFrom:(DAOLocation*)object
{
    return [[[self.class alloc] init] updateWith:object];
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
    self.website            = object.website;
    self.established        = object.established;
    self.mailingListURL     = object.mailingListURL;
    
    self.followingFlag      = object.followingFlag;
    
    self.numCheckins        = object.numCheckins;
    self.numFavorites       = object.numFavorites;
    self.numFollowers       = object.numFollowers;
    self.numRatings         = object.numRatings;
    self.numReviews         = object.numReviews;
    self.numWishlists       = object.numWishlists;
    
    if (object.photos || ![self.id isEqualToString:object.id])
    {
        self.photos = object.photos;
    }

    if (object.items || ![self.id isEqualToString:object.id])
    {
        self.items  = object.items;
    }
    
    return self;
}

@end
