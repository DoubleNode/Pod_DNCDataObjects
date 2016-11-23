//
//  DAONews.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAONews.h"

@implementation DAONews

+ (instancetype)news    {   return [[[self class] alloc] init]; }

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
    
    return [self isEqualToNews:object];
}

- (BOOL)isEqualToNews:(DAONews*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)copyWithZone:(NSZone*)zone
{
    typeof(self)    copy = [super copyWithZone:zone];
    
    copy.title      = self.title;
    copy.body       = self.body;
    copy.bodyShort  = self.bodyShort;
    
    copy.imageUrl   = self.imageUrl;
    
    copy.expiration = self.expiration;
    
    copy.numFavorites   = self.numFavorites;
    
    copy.myFavorite     = self.myFavorite;
    
    return copy;
}

@end
