//
//  DAOMessage.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOMessage.h"

#import "DAOCategory.h"
#import "DAOConversation.h"
#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOPhoto.h"
#import "DAOUser.h"

@implementation DAOMessage

+ (instancetype)message {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOMessage*)object
{
    return [[self.class.alloc init] updateWith:object];
}

- (id)init
{
    self = [super init];
    if (self)
    {
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[self class]])
    {
        return NO;
    }
    
    return [self isEqualToMessage:object];
}

- (BOOL)isEqualToMessage:(DAOMessage*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOMessage*)object
{
    [super updateWith:object];
    
    self.subject    = object.subject;
    self.message    = object.message;
    self.type       = object.type;
    
    if (![object.conversation isEqualToConversation:self.conversation])
    {
        self.conversation   = object.conversation;
    }
    
    if (object.photos || ![self.id isEqualToString:object.id])
    {
        self.photos  = object.photos;
    }
    
    if (![object.fromCategory isEqualToCategory:self.fromCategory])
    {
        self.fromCategory   = object.fromCategory;
    }
    if (![object.fromItem isEqualToItem:self.fromItem])
    {
        self.fromItem   = object.fromItem;
    }
    if (![object.fromLocation isEqualToLocation:self.fromLocation])
    {
        self.fromLocation   = object.fromLocation;
    }
    if (![object.fromUser isEqualToUser:self.fromUser])
    {
        self.fromUser   = object.fromUser;
    }
    
    return object;
}

@end
