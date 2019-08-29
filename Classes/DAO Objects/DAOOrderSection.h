//
//  DAOOrderSection.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOItem;
@class DAOLineitem;
@class DAOLocation;
@class DAOOrder;

@interface DAOOrderSection : DAOBase

+ (instancetype)orderSection;

- (BOOL)isEqualToOrderSection:(DAOOrderSection*)object;

@property (nonatomic, copy) NSString*       orderId;
@property (nonatomic, copy) DAOOrder*       order;

@property (nonatomic, copy) NSString*       name;
@property (nonatomic, copy) NSNumber*       total;
@property (nonatomic, copy) NSDictionary*   data;

@property (nonatomic, copy) NSString*       categoryId;
@property (nonatomic, copy) DAOCategory*    category;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@property (nonatomic, copy) NSArray<DAOLineitem*>*      lineitems;

@end
