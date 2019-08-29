//
//  DAOFavorite.m
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "DAOFavorite.h"

#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOUser.h"

@implementation DAOFavorite

+ (instancetype)favorite   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOFavorite*)object
{
    return [[self.class.alloc init] updateWith:object];
}

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
    
    return [self isEqualToFavorite:object];
}

- (BOOL)isEqualToFavorite:(DAOFavorite*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.newsId isEqualToString:self.newsId])           {   return NO;  }
    if (![object.photoId isEqualToString:self.photoId])         {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOFavorite*)object
{
    [super updateWith:object];
    
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
    
    if (object.news || (object.newsId && ![self.newsId isEqualToString:object.newsId]))
    {
        self.news   = object.news;
    }
    self.newsId = object.newsId;
    
    if (object.photo || (object.photoId && ![self.photoId isEqualToString:object.photoId]))
    {
        self.photo  = object.photo;
    }
    self.photoId    = object.photoId;
    
    if (object.user || (object.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = object.userId;
    
    return self;
}

@end
