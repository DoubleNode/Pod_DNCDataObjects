//
//  DAOFollow.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOItem;
@class DAOLocation;
@class DAOUser;

@interface DAOFollow : DAOBase

+ (instancetype)follow;

- (BOOL)isEqualToFollow:(DAOFollow*)object;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       user2Id;
@property (nonatomic, copy) DAOUser*        user2;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@end
