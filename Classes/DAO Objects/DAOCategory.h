//
//  DAOCategory.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOFavorite;
@class DAOFollow;
@class DAOItem;
@class DAOLocation;
@class DAOPhoto;
@class DAORating;
@class DAOReview;
@class DAOWishlist;

@interface DAOCategory : DAOBase

+ (instancetype)category;

- (BOOL)isEqualToCategory:(DAOCategory*)object;

@property (nonatomic, copy) NSString*   title;
@property (nonatomic, copy) NSString*   descriptionString;
@property (nonatomic)       NSNumber*   rating;
@property (nonatomic, copy) DAOPhoto*   defaultPhoto;

@property (nonatomic, copy) NSNumber*       numCheckins;
@property (nonatomic, copy) NSNumber*       numFavorites;
@property (nonatomic, copy) NSNumber*       numFlags;
@property (nonatomic, copy) NSNumber*       numFollowers;
@property (nonatomic, copy) NSNumber*       numItems;
@property (nonatomic, copy) NSNumber*       numRatings;
@property (nonatomic, copy) NSNumber*       numReviews;
@property (nonatomic, copy) NSNumber*       numTags;
@property (nonatomic, copy) NSNumber*       numWishlists;

@property (nonatomic, copy) DAOFavorite*    myFavorite;
@property (nonatomic, copy) DAOFollow*      myFollow;
@property (nonatomic, copy) DAORating*      myRating;
@property (nonatomic, copy) DAOReview*      myReview;
@property (nonatomic, copy) DAOWishlist*    myWishlist;

@property (nonatomic, copy) NSMutableDictionary*    optionIds;
@property (nonatomic, copy) NSMutableDictionary*    options;

@property (nonatomic, copy) NSArray<DAOFavorite*>*      favorites;
@property (nonatomic, copy) NSArray<DAOItem*>*          items;
@property (nonatomic, copy) NSArray<DAOLocation*>*      locations;
@property (nonatomic, copy) NSArray<DAOPhoto*>*         photos;
@property (nonatomic, copy) NSArray<DAOWishlist*>*      wishlists;

@end
