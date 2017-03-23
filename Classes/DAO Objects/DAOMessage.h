//
//  DAOMessage.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOConversation;
@class DAOItem;
@class DAOLocation;
@class DAOUser;

@interface DAOMessage : DAOBase

+ (instancetype)message;

- (BOOL)isEqualToMessage:(DAOMessage*)object;

@property (nonatomic, copy) DAOConversation*    conversation;

@property (nonatomic, copy) NSString*   subject;
@property (nonatomic, copy) NSString*   message;
@property (nonatomic, copy) NSString*   type;

@property (nonatomic, copy) DAOCategory*    fromCategory;
@property (nonatomic, copy) DAOItem*        fromItem;
@property (nonatomic, copy) DAOLocation*    fromLocation;
@property (nonatomic, copy) DAOUser*        fromUser;

@end
