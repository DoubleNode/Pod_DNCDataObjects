//
//  DAOUserDevice.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOUser;

@interface DAOUserDevice : DAOBase

+ (instancetype)userDevice;

- (BOOL)isEqualToUserDevice:(DAOUserDevice*)object;

@property (nonatomic, copy)     NSString*   deviceId;
@property (nonatomic, copy)     NSString*   deviceType;
@property (nonatomic, copy)     NSString*   serviceId;

@property (nonatomic, copy)     NSString*   userId;
@property (nonatomic, copy)     DAOUser*    user;

@end
