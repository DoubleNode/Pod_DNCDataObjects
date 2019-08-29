//
//  DAOActivity.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOActivity.h"

#import "DAOItem.h"
#import "DAOCheckin.h"
#import "DAOFavorite.h"
#import "DAONews.h"
#import "DAOPhoto.h"
#import "DAORating.h"
#import "DAOReview.h"
#import "DAOUser.h"
#import "DAOWishlist.h"

NSString* const kActivityCodeCheckin            = @"checkin";
NSString* const kActivityCodeFavorite           = @"favorite";
NSString* const kActivityCodeItemCreated        = @"item_created";
NSString* const kActivityCodeLocationCreated    = @"location_created";
NSString* const kActivityCodeNewsCreated        = @"news_created";
NSString* const kActivityCodeNewsUpdated        = @"news_updated";
NSString* const kActivityCodePhoto              = @"photo";
NSString* const kActivityCodeRating             = @"rating";
NSString* const kActivityCodeReview             = @"review";
NSString* const kActivityCodeWishlist           = @"wishlist";

NSString* const kActivityTypeItem       = @"item";
NSString* const kActivityTypeLocation   = @"location";
NSString* const kActivityTypeNews       = @"news";
NSString* const kActivityTypePhoto      = @"photo";

@implementation DAOActivity

#pragma mark - Object lifecycle

+ (instancetype)activity   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOActivity*)object
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
    if (![super isEqual:object])
    {
        return NO;
    }
    
    return [self isEqualToActivity:object];
}

- (BOOL)isEqualToActivity:(DAOActivity*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.code isEqualToString:self.code])   {   return NO;  }
    if (![object.type isEqualToString:self.type])   {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOActivity*)object
{
    [super updateWith:object];
    
    self.code   = object.code;
    self.type   = object.type;
    self.typeId = object.typeId;
    
    if (object.checkin || (object.checkinId && ![self.checkinId isEqualToString:object.checkinId]))
    {
        self.checkin    = object.checkin;
    }
    self.checkinId  = object.checkinId;
    
    if (object.favorite || (object.favoriteId && ![self.favoriteId isEqualToString:object.favoriteId]))
    {
        self.favorite   = object.favorite;
    }
    self.favoriteId = object.favoriteId;
    
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
    
    if (object.news || (object.newsId && ![self.newsId isEqualToString:object.newsId]))
    {
        self.news   = object.news;
    }
    self.newsId = object.newsId;
    
    if (object.photo || (object.photoId && ![self.photoId isEqualToString:object.photoId]))
    {
        self.photo  = object.photo;
    }
    self.photoId    = object.photoId;
    
    if (object.rating || (object.ratingId && ![self.ratingId isEqualToString:object.ratingId]))
    {
        self.rating = object.rating;
    }
    self.ratingId   = object.ratingId;
    
    if (object.review || (object.reviewId && ![self.reviewId isEqualToString:object.reviewId]))
    {
        self.review = object.review;
    }
    self.reviewId   = object.reviewId;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;
    
    if (object.wishlist || (object.wishlistId && ![self.wishlistId isEqualToString:object.wishlistId]))
    {
        self.wishlist   = object.wishlist;
    }
    self.wishlistId = object.wishlistId;
    
    self.numFavorites   = object.numFavorites;
    
    self.myFavorite     = object.myFavorite;
    
    return self;
}

@end
