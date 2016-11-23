//
//  DAORating.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAORating.h"

#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOReview.h"
#import "DAOUser.h"

@implementation DAORating

#pragma mark - Object lifecycle

+ (instancetype)rating   {   return [[self.class alloc] init]; }

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
    
    return [self isEqualToRating:object];
}

- (BOOL)isEqualToRating:(DAORating*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)copyWithZone:(NSZone*)zone
{
    typeof(self)    copy = [super copyWithZone:zone];
    
    copy.value      = self.value;
    
    if (self.item || ![copy.itemId isEqualToString:self.itemId])
    {
        copy.item  = self.item;
    }
    copy.itemId  = self.itemId;
    
    if (self.location || ![copy.locationId isEqualToString:self.locationId])
    {
        copy.location  = self.location;
    }
    copy.locationId  = self.locationId;
    
    if (self.review || ![copy.reviewId isEqualToString:self.reviewId])
    {
        copy.review  = self.review;
    }
    copy.reviewId  = self.reviewId;
    
    if (self.user || ![copy.userId isEqualToString:self.userId])
    {
        copy.user  = self.user;
    }
    copy.userId  = self.userId;
    
    return copy;
}

@end
