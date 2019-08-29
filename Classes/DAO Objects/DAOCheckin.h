//
//  DAOCheckin.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOItem;
@class DAOLocation;
@class DAOPhoto;
@class DAOUser;

@interface DAOCheckin : DAOBase

+ (instancetype)checkin;

- (BOOL)isEqualToCheckin:(DAOCheckin*)object;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       photoId;
@property (nonatomic, copy) DAOPhoto*       photo;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
