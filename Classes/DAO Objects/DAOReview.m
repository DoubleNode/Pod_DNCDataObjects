//
//  DAOReview.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOReview.h"

#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAORating.h"
#import "DAOPhoto.h"
#import "DAOUser.h"

@implementation DAOReview

#pragma mark - Object lifecycle

+ (instancetype)review   {   return [[[self class] alloc] init]; }

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
    
    return [self isEqualToReview:object];
}

- (BOOL)isEqualToReview:(DAOReview*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.photoId isEqualToString:self.photoId])         {   return NO;  }
    if (![object.ratingId isEqualToString:self.ratingId])       {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)copyWithZone:(NSZone*)zone
{
    typeof(self)    copy = [super copyWithZone:zone];
    
    copy.text           = self.text;
    
    copy.ratingValue    = self.ratingValue;
    
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
    
    if (self.rating || ![copy.ratingId isEqualToString:self.ratingId])
    {
        copy.rating  = self.rating;
    }
    copy.ratingId  = self.ratingId;
    
    if (self.photo || ![copy.photoId isEqualToString:self.photoId])
    {
        copy.photo  = self.photo;
    }
    copy.photoId  = self.photoId;
    
    if (self.user || ![copy.userId isEqualToString:self.userId])
    {
        copy.user  = self.user;
    }
    copy.userId  = self.userId;
    
    return copy;
}

@end
