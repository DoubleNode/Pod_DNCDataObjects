//
//  DAOItem.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOFavorite;
@class DAOFollow;
@class DAOLocation;
@class DAOPhoto;
@class DAORating;
@class DAOReview;
@class DAOWishlist;

@interface DAOItem : DAOBase

+ (instancetype)item;
+ (instancetype)copyFrom:(DAOItem*)object;

- (BOOL)isEqualToItem:(DAOItem*)object;

- (id)updateWith:(DAOItem*)object;

@property (nonatomic, copy) NSString*       remoteId;
@property (nonatomic, copy) NSString*       type;

@property (nonatomic, copy) NSString*       name;
@property (nonatomic, copy) NSString*       descriptionString;
@property (nonatomic)       NSNumber*       rating;
@property (nonatomic, copy) NSDictionary*   ratingTypes;
@property (nonatomic, copy) DAOPhoto*       defaultPhoto;

@property (nonatomic, copy) NSNumber*       numCheckins;
@property (nonatomic, copy) NSNumber*       numFavorites;
@property (nonatomic, copy) NSNumber*       numFollowers;
@property (nonatomic, copy) NSNumber*       numRatings;
@property (nonatomic, copy) NSNumber*       numReviews;
@property (nonatomic, copy) NSNumber*       numWishlists;

@property (nonatomic, copy) DAOFavorite*    myFavorite;
@property (nonatomic, copy) DAOFollow*      myFollow;
@property (nonatomic, copy) DAORating*      myRating;
@property (nonatomic, copy) DAOReview*      myReview;
@property (nonatomic, copy) DAOWishlist*    myWishlist;

@property (nonatomic, copy)     NSMutableDictionary*    optionIds;
@property (nonatomic, copy)     NSMutableDictionary*    options;

@property (nonatomic, copy) NSArray<DAOCategory*>*  categories;
@property (nonatomic, copy) NSArray<DAOFavorite*>*  favorites;
@property (nonatomic, copy) NSArray<DAOLocation*>*  locations;
@property (nonatomic, copy) NSArray<DAOPhoto*>*     photos;
@property (nonatomic, copy) NSArray<DAOWishlist*>*  wishlists;

@end
