//
//  DAOSocialAccount.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOLocation;
@class DAOUser;

@interface DAOSocialAccount : DAOBase

+ (instancetype)socialAccount;

- (BOOL)isEqualToSocialAccount:(DAOSocialAccount*)object;

@property (nonatomic, copy) NSString*   type;
@property (nonatomic, copy) NSString*   handle;
@property (nonatomic, copy) NSString*   url;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
