//
//  DAORating.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOItem;
@class DAOLocation;
@class DAOReview;
@class DAOUser;

@interface DAORating : DAOBase

+ (instancetype)rating;

- (BOOL)isEqualToRating:(DAORating*)object;

@property (nonatomic, copy) NSNumber*       value;
@property (nonatomic, copy) NSString*       ratingType;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       reviewId;
@property (nonatomic, copy) DAOReview*      review;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
