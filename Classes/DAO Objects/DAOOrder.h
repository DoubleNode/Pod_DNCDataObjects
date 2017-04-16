//
//  DAOOrder.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOItem;
@class DAOLineitem;
@class DAOLocation;
@class DAOTransaction;

@interface DAOOrder : DAOBase

+ (instancetype)order;

- (BOOL)isEqualToOrder:(DAOOrder*)object;

@property (nonatomic, copy) NSString*       status;
@property (nonatomic, copy) NSString*       state;
@property (nonatomic, copy) NSNumber*       total;

@property (nonatomic, copy) NSString*       categoryId;
@property (nonatomic, copy) DAOCategory*    category;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@property (nonatomic, copy) NSArray<DAOLineitem*>*      lineitems;
@property (nonatomic, copy) NSArray<DAOTransaction*>*   transactions;

@end