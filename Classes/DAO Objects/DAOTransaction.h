//
//  DAOTransaction.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOContact;
@class DAOItem;
@class DAOLocation;
@class DAOOrder;
@class DAOPaymentAccount;
@class DAOUser;

@interface DAOTransaction : DAOBase

+ (instancetype)transaction;

- (BOOL)isEqualToTransaction:(DAOTransaction*)object;

@property (nonatomic, copy) DAOOrder*           order;
@property (nonatomic, copy) DAOContact*         contact;
@property (nonatomic, copy) DAOPaymentAccount*  paymentAccount;

@property (nonatomic, copy) NSString*       type;
@property (nonatomic, copy) NSString*       status;
@property (nonatomic, copy) NSString*       authorizationCode;
@property (nonatomic, copy) NSString*       discountCode;

@property (nonatomic, copy) NSNumber*       subtotal;
@property (nonatomic, copy) NSNumber*       discount;
@property (nonatomic, copy) NSNumber*       tax;
@property (nonatomic, copy) NSNumber*       total;

@property (nonatomic, copy) NSString*       paymentType;
@property (nonatomic, copy) NSDictionary*   paymentData;

@property (nonatomic, copy) NSDate*         holdUntil;
@property (nonatomic, copy) NSDate*         cancelAfter;
@property (nonatomic, copy) NSDate*         charged;
@property (nonatomic, copy) NSDate*         captured;

@property (nonatomic, copy) NSString*       categoryId;
@property (nonatomic, copy) DAOCategory*    category;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
