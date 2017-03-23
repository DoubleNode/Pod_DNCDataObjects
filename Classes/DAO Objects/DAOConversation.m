//
//  DAOConversation.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOConversation.h"

#import "DAOUser.h"

@implementation DAOConversation

+ (instancetype)conversation    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOConversation*)object
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
    
    return [self isEqualToConversation:object];
}

- (BOOL)isEqualToConversation:(DAOConversation*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOConversation*)object
{
    [super updateWith:object];
    
    self.categories = object.categories;
    self.items      = object.items;
    self.locations  = object.locations;
    self.users      = object.users;
    
    return object;
}

@end
