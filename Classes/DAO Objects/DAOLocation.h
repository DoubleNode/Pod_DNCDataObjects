//
//  DAOLocation.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOItem;
@class DAOFavorite;
@class DAOFollow;
@class DAOPhoto;
@class DAORating;
@class DAOReview;
@class DAOSocialAccount;
@class DAOWishlist;

@interface DAOLocation : DAOBase

+ (instancetype)location;
+ (instancetype)copyFrom:(DAOLocation*)object;

- (BOOL)isEqualToLocation:(DAOLocation*)object;

- (id)updateWith:(DAOLocation*)object;

@property (nonatomic, copy) NSString*       externalId;
@property (nonatomic, copy) NSString*       name;
@property (nonatomic, copy) NSNumber*       type;
@property (nonatomic, copy) NSString*       descriptionString;
@property (nonatomic, copy) NSString*       website;
@property (nonatomic)       NSNumber*       established;
@property (nonatomic, copy) NSString*       mailingListURL;

@property (nonatomic, assign, getter = isFollowing) BOOL followingFlag;

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

@property (copy, nonatomic)     NSMutableDictionary*    optionIds;
@property (copy, nonatomic)     NSMutableDictionary*    options;

@property (nonatomic, copy) NSArray<DAOItem*>*          items;
@property (nonatomic, copy) NSArray<DAOPhoto*>*         photos;
@property (nonatomic, copy) NSArray<DAOSocialAccount*>* socialAccounts;

@end
