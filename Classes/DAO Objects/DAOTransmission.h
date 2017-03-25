//
//  DAOTransmission.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAONotification;
@class DAOUser;

@interface DAOTransmission : DAOBase

+ (instancetype)transmission;

- (BOOL)isEqualToTransmission:(DAOTransmission*)object;

@property (nonatomic, copy) NSString*   to;
@property (nonatomic, copy) NSString*   body;

@property (nonatomic, copy) NSDate*     sent;
@property (nonatomic, copy) NSDate*     read;

@property (nonatomic, copy) NSString*           notificationId;
@property (nonatomic, copy) DAONotification*    notification;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
