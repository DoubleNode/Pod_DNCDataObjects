//
//  DAOItem.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOItem.h"

#import "DAOLocation.h"
#import "DAOFavorite.h"
#import "DAOFollow.h"
#import "DAORating.h"
#import "DAOReview.h"
#import "DAOWishlist.h"

@implementation DAOItem

+ (instancetype)item    {   return [[self.class alloc] init]; }

+ (instancetype)copyFrom:(DAOItem*)object
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
    
    return [self isEqualToItem:object];
}

- (BOOL)isEqualToItem:(DAOItem*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOItem*)object
{
    [super updateWith:object];
    
    self.remoteId                   = object.remoteId;
    self.type                       = object.type;
    
    self.name                       = object.name;
    self.descriptionString          = object.descriptionString;
    self.rating                     = object.rating;
    
    self.numFollowers               = object.numFollowers;
    self.numRatings                 = object.numRatings;
    self.numReviews                 = object.numReviews;
    self.numFavorites               = object.numFavorites;
    self.numWishlists               = object.numWishlists;
    self.numCheckins                = object.numCheckins;
    
    self.myFavorite                 = object.myFavorite;
    self.myWishlist                 = object.myWishlist;
    self.myReview                   = object.myReview;
    self.myRating                   = object.myRating;
    self.myFollow                   = object.myFollow;
    
    if (object.locations || ![self.id isEqualToString:object.id])
    {
        self.locations  = object.locations;
    }
    
    return object;
}

@end
