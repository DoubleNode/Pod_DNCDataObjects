//
//  DAOMessage.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOMessage.h"

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
    
    self.message    = object.message;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;
    
    return object;
}

@end
