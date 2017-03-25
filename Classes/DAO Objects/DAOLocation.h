//
//  DAOLocation.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOFavorite;
@class DAOFollow;
@class DAOItem;
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
@property (nonatomic)       NSNumber*       rating;
@property (nonatomic, copy) DAOPhoto*       defaultPhoto;

@property (nonatomic, copy) NSString*       phone;
@property (nonatomic, copy) NSString*       address;
@property (nonatomic, copy) NSString*       address2;
@property (nonatomic, copy) NSString*       city;
@property (nonatomic, copy) NSString*       state;
@property (nonatomic, copy) NSString*       postalCode;
@property (nonatomic, copy) NSString*       country;
@property (nonatomic, copy) NSString*       geohash;
@property (nonatomic, copy) NSNumber*       latitude;
@property (nonatomic, copy) NSNumber*       longitude;

@property (nonatomic, assign, getter = isFollowing) BOOL followingFlag;

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
@property (nonatomic, copy) NSArray<DAOItem*>*      items;
@property (nonatomic, copy) NSArray<DAOPhoto*>*     photos;
@property (nonatomic, copy) NSArray<DAOWishlist*>*  wishlists;

@property (nonatomic, copy) NSArray<DAOSocialAccount*>* socialAccounts;

@end
