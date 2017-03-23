//
//  DAOConversation.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOItem;
@class DAOLocation;
@class DAOUser;

@interface DAOConversation : DAOBase

+ (instancetype)conversation;

- (BOOL)isEqualToConversation:(DAOConversation*)object;

@property (nonatomic, copy) NSArray<DAOCategory*>*  categories;
@property (nonatomic, copy) NSArray<DAOItem*>*      items;
@property (nonatomic, copy) NSArray<DAOLocation*>*  locations;
@property (nonatomic, copy) NSArray<DAOUser*>*      users;

@end
