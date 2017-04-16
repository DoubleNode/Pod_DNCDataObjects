//
//  DAOLineitem.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOItem;
@class DAOLocation;
@class DAOOrder;
@class DAOUser;

@interface DAOLineitem : DAOBase

+ (instancetype)lineitem;

- (BOOL)isEqualToLineitem:(DAOLineitem*)object;

@property (nonatomic, copy) NSString*       orderId;
@property (nonatomic, copy) DAOOrder*       order;

@property (nonatomic, copy) NSString*       name;
@property (nonatomic, copy) NSNumber*       quantity;
@property (nonatomic, copy) NSNumber*       price;
@property (nonatomic, copy) NSNumber*       total;

@property (nonatomic, copy) NSString*       categoryId;
@property (nonatomic, copy) DAOCategory*    category;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
