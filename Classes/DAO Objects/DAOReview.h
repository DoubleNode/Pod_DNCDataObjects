//
//  DAOReview.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOItem;
@class DAOLocation;
@class DAOPhoto;
@class DAORating;
@class DAOUser;

@interface DAOReview : DAOBase

+ (instancetype)review;

- (BOOL)isEqualToReview:(DAOReview*)object;

@property (nonatomic, copy) NSString*       text;

@property (nonatomic, copy) NSNumber*       ratingValue;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       ratingId;
@property (nonatomic, copy) DAORating*      rating;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@property (nonatomic, copy) NSString*       photoId;
@property (nonatomic, copy) DAOPhoto*       photo;

@property (nonatomic, copy) NSDictionary<NSString*, DAORating*>*    keyedRatings;

@property (nonatomic, copy) NSArray<DAOPhoto*>*     photos;
@property (nonatomic, copy) NSArray<DAORating*>*    ratings;

@end
