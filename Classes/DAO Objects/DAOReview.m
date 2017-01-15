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

+ (instancetype)review   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOReview*)object
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

- (id)updateWith:(DAOReview*)object
{
    [super updateWith:object];
    
    self.text           = object.text;
    self.ratingValue    = object.ratingValue;
    
    if (object.item || (object.itemId && ![self.itemId isEqualToString:object.itemId]))
    {
        self.item   = object.item;
    }
    self.itemId = object.itemId;
    
    if (object.location || (object.locationId && ![self.locationId isEqualToString:object.locationId]))
    {
        self.location   = object.location;
    }
    self.locationId = object.locationId;
    
    if (object.photo || (object.photoId && ![self.photoId isEqualToString:object.photoId]))
    {
        self.photo = object.photo;
    }
    self.photoId   = object.photoId;
    
    if (object.rating || (object.ratingId && ![self.ratingId isEqualToString:object.ratingId]))
    {
        self.rating = object.rating;
    }
    self.ratingId   = object.ratingId;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;
    
    return object;
}

@end
