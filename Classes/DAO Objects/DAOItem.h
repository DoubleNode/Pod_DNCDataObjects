//
//  DAOItem.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOLocation;
@class DAOFavorite;
@class DAOFollow;
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

@property (copy, nonatomic) NSNumber*       numCheckins;
@property (copy, nonatomic) NSNumber*       numFavorites;
@property (copy, nonatomic) NSNumber*       numFollowers;
@property (copy, nonatomic) NSNumber*       numRatings;
@property (copy, nonatomic) NSNumber*       numReviews;
@property (copy, nonatomic) NSNumber*       numWishlists;

@property (nonatomic, copy) DAOFavorite*    myFavorite;
@property (nonatomic, copy) DAOFollow*      myFollow;
@property (nonatomic, copy) DAORating*      myRating;
@property (nonatomic, copy) DAOReview*      myReview;
@property (nonatomic, copy) DAOWishlist*    myWishlist;

@property (nonatomic, copy) NSArray<DAOLocation*>*  locations;
@property (nonatomic, copy) NSArray<DAOPhoto*>*     photos;

@end
