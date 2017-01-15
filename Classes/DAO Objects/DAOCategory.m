//
//  DAOCategory.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOCategory.h"

@implementation DAOCategory

+ (instancetype)category    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOCategory*)object
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
    if (![super isEqual:object])
    {
        return NO;
    }
    
    return [self isEqualToCategory:object];
}

- (BOOL)isEqualToCategory:(DAOCategory*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOCategory*)object
{
    [super updateWith:object];
    
    self.title              = object.title;
    self.descriptionString  = object.descriptionString;
    
    self.numCheckins        = object.numCheckins;
    self.numFavorites       = object.numFavorites;
    self.numFollowers       = object.numFollowers;
    self.numRatings         = object.numRatings;
    self.numReviews         = object.numReviews;
    self.numWishlists       = object.numWishlists;
    
    self.myFavorite         = object.myFavorite;
    self.myFollow           = object.myFollow;
    self.myRating           = object.myRating;
    self.myReview           = object.myReview;
    self.myWishlist         = object.myWishlist;
    
    self.myFollow       = object.myFollow;
    
    self.optionIds      = [object.optionIds mutableCopy];
    self.options        = [object.options mutableCopy];
    
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
    
    if (object.photos || ![self.id isEqualToString:object.id])
    {
        self.photos  = object.photos;
    }
    
    if (object.wishlists || ![self.id isEqualToString:object.id])
    {
        self.wishlists  = object.wishlists;
    }
    
    return self;
}

@end
