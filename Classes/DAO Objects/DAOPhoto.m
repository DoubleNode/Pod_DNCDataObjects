//
//  DAOPhoto.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOPhoto.h"

#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOMessage.h"
#import "DAOReview.h"
#import "DAOUser.h"

@implementation DAOPhoto

+ (instancetype)photo   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOPhoto*)object
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
    
    return [self isEqualToPhoto:object];
}

- (BOOL)isEqualToPhoto:(DAOPhoto*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.categoryId isEqualToString:self.categoryId])   {   return NO;  }
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.messageId isEqualToString:self.messageId])     {   return NO;  }
    if (![object.reviewId isEqualToString:self.reviewId])       {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOPhoto*)object
{
    [super updateWith:object];
    
    self.url            = object.url;
    self.url_preload    = object.url_preload;
    self.comment        = object.comment;
    
    self.file           = object.file;
    
    if (object.category || (object.categoryId && ![self.categoryId isEqualToString:object.categoryId]))
    {
        self.category   = object.category;
    }
    self.itemId = object.itemId;
    
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
    
    if (object.message || (object.messageId && ![self.messageId isEqualToString:object.messageId]))
    {
        self.message   = object.message;
    }
    self.messageId = object.messageId;
    
    if (object.review || (object.reviewId && ![self.reviewId isEqualToString:object.reviewId]))
    {
        self.review = object.review;
    }
    self.reviewId   = object.reviewId;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;

    self.numFavorites   = object.numFavorites;
    
    self.myFavorite     = object.myFavorite;

    return object;
}

@end
