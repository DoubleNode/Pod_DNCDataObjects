//
//  DAOFlag.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOFlag.h"

#import "DAOActivity.h"
#import "DAOCategory.h"
#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOMessage.h"
#import "DAONews.h"
#import "DAOPhoto.h"
#import "DAOUser.h"

@implementation DAOFlag

+ (instancetype)flag   {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAOFlag*)object
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
    
    return [self isEqualToFlag:object];
}

- (BOOL)isEqualToFlag:(DAOFlag*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.activityId isEqualToString:self.activityId])   {   return NO;  }
    if (![object.categoryId isEqualToString:self.categoryId])   {   return NO;  }
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.messageId isEqualToString:self.messageId])     {   return NO;  }
    if (![object.newsId isEqualToString:self.newsId])           {   return NO;  }
    if (![object.photoId isEqualToString:self.photoId])         {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOFlag*)object
{
    [super updateWith:object];
    
    self.action = object.action;
    self.text   = object.text;
    
    if (object.activity || (object.activityId && ![self.activityId isEqualToString:object.activityId]))
    {
        self.activity   = object.activity;
    }
    self.activityId = object.activityId;
    
    if (object.category || (object.categoryId && ![self.categoryId isEqualToString:object.categoryId]))
    {
        self.category   = object.category;
    }
    self.categoryId = object.categoryId;
    
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
        self.messageId = object.messageId;
    }
    self.messageId = object.messageId;
    
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
