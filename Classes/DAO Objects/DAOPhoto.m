//
//  DAOPhoto.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOPhoto.h"

#import "DAOItem.h"
#import "DAOLocation.h"
#import "DAOReview.h"
#import "DAOUser.h"

@implementation DAOPhoto

+ (instancetype)photo   {   return [[[self class] alloc] init]; }

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
    
    if (![object.itemId isEqualToString:self.itemId])           {   return NO;  }
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.reviewId isEqualToString:self.reviewId])       {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }
    
    return YES;
}

- (id)copyWithZone:(NSZone*)zone
{
    typeof(self)    copy = [super copyWithZone:zone];
    
    copy.url            = self.url;
    copy.url_preload    = self.url_preload;
    copy.comment        = self.comment;
    
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
    
    copy.numFavorites   = self.numFavorites;
    
    copy.myFavorite     = self.myFavorite;
    
    return copy;
}

@end
