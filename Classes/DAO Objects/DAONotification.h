//
//  DAONotification.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOUser;

@interface DAONotification : DAOBase

+ (instancetype)notification;

- (BOOL)isEqualToNotification:(DAONotification*)object;

@property (nonatomic, copy) NSString*       type;
@property (nonatomic, copy) NSDictionary*   data;
@property (nonatomic, copy) NSString*       disposition;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
