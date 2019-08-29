//
//  DAOUserNotificationSetting.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOUser;

@interface DAOUserNotificationSetting : DAOBase

+ (instancetype)userNotificationSetting;

- (BOOL)isEqualToUserNotificationSetting:(DAOUserNotificationSetting*)object;

@property (assign, nonatomic, getter=isEmailEnabled)    BOOL    emailEnabled;
@property (assign, nonatomic, getter=isPushEnabled)     BOOL    pushEnabled;
@property (assign, nonatomic, getter=isSmsEnabled)      BOOL    smsEnabled;

@property (nonatomic, copy)     NSString*   keycode;

@property (nonatomic, copy)     NSString*   userId;
@property (nonatomic, copy)     DAOUser*    user;

@end
