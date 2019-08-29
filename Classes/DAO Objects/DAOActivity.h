//
//  DAOActivity.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOItem;
@class DAOLocation;
@class DAOCheckin;
@class DAOFavorite;
@class DAONews;
@class DAOPhoto;
@class DAORating;
@class DAOReview;
@class DAOUser;
@class DAOWishlist;

extern NSString* const kActivityCodeCheckin;
extern NSString* const kActivityCodeFavorite;
extern NSString* const kActivityCodeItemCreated;
extern NSString* const kActivityCodeLocationCreated;
extern NSString* const kActivityCodeNewsCreated;
extern NSString* const kActivityCodeNewsUpdated;
extern NSString* const kActivityCodePhoto;
extern NSString* const kActivityCodeRating;
extern NSString* const kActivityCodeReview;
extern NSString* const kActivityCodeWishlist;

extern NSString* const kActivityTypeItem;
extern NSString* const kActivityTypeLocation;
extern NSString* const kActivityTypeNews;
extern NSString* const kActivityTypePhoto;

@interface DAOActivity : DAOBase

+ (instancetype)activity;
+ (instancetype)copyFrom:(DAOActivity*)object;

- (BOOL)isEqualToActivity:(DAOActivity*)object;

@property (nonatomic, copy) NSString*       code;

@property (nonatomic, copy) NSString*       type;
@property (nonatomic, copy) NSString*       typeId;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       checkinId;
@property (nonatomic, copy) DAOCheckin*     checkin;

@property (nonatomic, copy) NSString*       favoriteId;
@property (nonatomic, copy) DAOFavorite*    favorite;

@property (nonatomic, copy) NSString*       newsId;
@property (nonatomic, copy) DAONews*        news;

@property (nonatomic, copy) NSString*       photoId;
@property (nonatomic, copy) DAOPhoto*       photo;

@property (nonatomic, copy) NSString*       ratingId;
@property (nonatomic, copy) DAORating*      rating;

@property (nonatomic, copy) NSString*       reviewId;
@property (nonatomic, copy) DAOReview*      review;

@property (nonatomic, copy) NSString*       wishlistId;
@property (nonatomic, copy) DAOWishlist*    wishlist;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@property (nonatomic, copy) NSNumber*       numFavorites;

@property (nonatomic, copy) DAOFavorite*    myFavorite;

@end
