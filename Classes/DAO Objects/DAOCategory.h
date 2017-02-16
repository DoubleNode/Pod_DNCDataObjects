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

@property (copy, nonatomic) NSNumber*       numCheckins;
@property (copy, nonatomic) NSNumber*       numFavorites;
@property (copy, nonatomic) NSNumber*       numFlags;
@property (copy, nonatomic) NSNumber*       numFollowers;
@property (copy, nonatomic) NSNumber*       numItems;
@property (copy, nonatomic) NSNumber*       numRatings;
@property (copy, nonatomic) NSNumber*       numReviews;
@property (copy, nonatomic) NSNumber*       numTags;
@property (copy, nonatomic) NSNumber*       numWishlists;

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
