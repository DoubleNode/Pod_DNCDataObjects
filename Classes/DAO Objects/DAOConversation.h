//
//  DAOConversation.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOItem;
@class DAOLocation;
@class DAOMessage;
@class DAOUser;

@interface DAOConversation : DAOBase

+ (instancetype)conversation;

- (BOOL)isEqualToConversation:(DAOConversation*)object;

@property (nonatomic, copy) NSNumber*   numMessages;
@property (nonatomic, copy) NSNumber*   numUnreadMessages;

@property (nonatomic, copy) NSDate*                 lastRead;
@property (nonatomic, copy) NSArray<DAOMessage*>*   messages;

@property (nonatomic, copy) NSArray<DAOCategory*>*  categories;
@property (nonatomic, copy) NSArray<DAOItem*>*      items;
@property (nonatomic, copy) NSArray<DAOLocation*>*  locations;
@property (nonatomic, copy) NSArray<DAOUser*>*      users;

@end
