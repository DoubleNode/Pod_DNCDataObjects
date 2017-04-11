//
//  DAONotification.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOItem;
@class DAOLocation;
@class DAOUser;

@interface DAONotification : DAOBase

+ (instancetype)notification;

- (BOOL)isEqualToNotification:(DAONotification*)object;

@property (nonatomic, copy) NSString*       keycode;
@property (nonatomic, copy) NSDictionary*   data;
@property (nonatomic, copy) NSString*       disposition;

@property (nonatomic, copy) NSString*       categoryId;
@property (nonatomic, copy) DAOCategory*    category;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
