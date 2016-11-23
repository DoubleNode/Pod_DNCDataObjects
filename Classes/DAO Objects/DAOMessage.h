//
//  DAOMessage.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOUser;

@interface DAOMessage : DAOBase

+ (instancetype)message;

- (BOOL)isEqualToMessage:(DAOMessage*)object;

@property (nonatomic, copy) NSString*       message;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
