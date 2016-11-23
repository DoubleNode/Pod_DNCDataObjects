//
//  DAOFavorite.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOItem;
@class DAOLocation;
@class DAONews;
@class DAOPhoto;
@class DAOUser;

@interface DAOFavorite : DAOBase

+ (instancetype)favorite;

- (BOOL)isEqualToFavorite:(DAOFavorite*)object;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       newsId;
@property (nonatomic, copy) DAONews*        news;

@property (nonatomic, copy) NSString*       photoId;
@property (nonatomic, copy) DAOPhoto*       photo;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
