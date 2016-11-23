//
//  DAOUserDevice.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOUser;

@interface DAOUserDevice : DAOBase

+ (instancetype)userDevice;

- (BOOL)isEqualToUserDevice:(DAOUserDevice*)object;

@property (copy, nonatomic)     NSString*   deviceId;
@property (copy, nonatomic)     NSString*   deviceType;

@property (copy, nonatomic)     NSString*   userId;
@property (copy, nonatomic)     DAOUser*    user;

@end
