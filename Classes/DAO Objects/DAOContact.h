//
//  DAOContact.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOUser;

@interface DAOContact : DAOBase

+ (instancetype)contact;

- (BOOL)isEqualToContact:(DAOContact*)object;

@property (nonatomic, copy) NSString*       type;
@property (nonatomic, copy) NSString*       name;
@property (nonatomic, copy) NSString*       email;
@property (nonatomic, copy) NSString*       phone;
@property (nonatomic, copy) NSString*       address;
@property (nonatomic, copy) NSString*       address2;
@property (nonatomic, copy) NSString*       city;
@property (nonatomic, copy) NSString*       state;
@property (nonatomic, copy) NSString*       postalCode;
@property (nonatomic, copy) NSString*       country;
@property (nonatomic, copy) NSString*       geohash;
@property (nonatomic, copy) NSNumber*       latitude;
@property (nonatomic, copy) NSNumber*       longitude;

@property (nonatomic, copy) NSDate*         verificationDate;

@property (nonatomic, assign, getter = isPrimary)   BOOL    primary;
@property (nonatomic, assign, getter = isVerified)  BOOL    verified;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
