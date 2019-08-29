//
//  DAOFlag.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOActivity;
@class DAOCategory;
@class DAOItem;
@class DAOLocation;
@class DAOMessage;
@class DAONews;
@class DAOPhoto;
@class DAOUser;

@interface DAOFlag : DAOBase

+ (instancetype)flag;

- (BOOL)isEqualToFlag:(DAOFlag*)object;

@property (nonatomic, copy) NSString*       action;
@property (nonatomic, copy) NSString*       text;

@property (nonatomic, copy) NSString*       activityId;
@property (nonatomic, copy) DAOActivity*    activity;

@property (nonatomic, copy) NSString*       categoryId;
@property (nonatomic, copy) DAOCategory*    category;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       messageId;
@property (nonatomic, copy) DAOMessage*     message;

@property (nonatomic, copy) NSString*       newsId;
@property (nonatomic, copy) DAONews*        news;

@property (nonatomic, copy) NSString*       photoId;
@property (nonatomic, copy) DAOPhoto*       photo;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
