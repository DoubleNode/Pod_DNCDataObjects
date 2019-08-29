//
//  DAOAuth.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOUser;

@interface DAOAuth : DAOBase

+ (instancetype)auth;

- (BOOL)isEqualToAuth:(DAOAuth*)object;

@property (nonatomic, copy) NSString*       type;
@property (nonatomic, copy) NSString*       token;

@property (nonatomic, copy) NSString*       bucketId;
@property (nonatomic, copy) NSString*       bucketName;

@property (nonatomic, copy) NSString*       accountId;
@property (nonatomic, copy) NSString*       apiUrl;
@property (nonatomic, copy) NSString*       downloadUrl;
@property (nonatomic, copy) NSNumber*       minimumPartSize;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
