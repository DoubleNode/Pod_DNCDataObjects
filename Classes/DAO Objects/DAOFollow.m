//
//  DAOFollow.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOFollow.h"

#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOUser.h"

@implementation DAOFollow

+ (instancetype)follow   {   return [[[self class] alloc] init]; }

#pragma mark - Object lifecycle

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
    if (![super isEqual:object])
    {
        return NO;
    }
    
    return [self isEqualToFollow:object];
}

- (BOOL)isEqualToFollow:(DAOFollow*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.user2Id isEqualToString:self.user2Id])         {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)copyWithZone:(NSZone*)zone
{
    typeof(self)    copy = [super copyWithZone:zone];
    
    if (self.item || ![copy.itemId isEqualToString:self.itemId])
    {
        copy.item  = self.item;
    }
    copy.itemId  = self.itemId;
    
    if (self.location || ![copy.locationId isEqualToString:self.locationId])
    {
        copy.location   = self.location;
    }
    copy.locationId = self.locationId;
    
    if (self.user2 || ![copy.user2Id isEqualToString:self.user2Id])
    {
        copy.user2  = self.user2;
    }
    copy.user2Id  = self.user2Id;
    
    if (self.user || ![copy.userId isEqualToString:self.userId])
    {
        copy.user  = self.user;
    }
    copy.userId  = self.userId;
    
    return copy;
}

@end
