//
//  DAOPaymentAccount.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOContact;
@class DAOUser;

@interface DAOPaymentAccount : DAOBase

+ (instancetype)paymentAccount;

- (BOOL)isEqualToPaymentAccount:(DAOPaymentAccount*)object;

@property (nonatomic, copy) NSString*       type;
@property (nonatomic, copy) NSString*       name;
@property (nonatomic, copy) NSString*       accountNumber;
@property (nonatomic, copy) NSDate*         expirationDate;
@property (nonatomic, copy) NSString*       ccv;

@property (nonatomic, copy) NSString*       contactId;
@property (nonatomic, copy) DAOContact*     contact;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
