//
//  DAONews.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAONews.h"

@implementation DAONews

+ (instancetype)news    {   return [self.class.alloc init]; }

+ (instancetype)copyFrom:(DAONews*)object
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
    
    return [self isEqualToNews:object];
}

- (BOOL)isEqualToNews:(DAONews*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAONews*)object
{
    [super updateWith:object];
    
    self.title      = object.title;
    self.body       = object.body;
    self.bodyShort  = object.bodyShort;

    self.imageUrl       = object.imageUrl;

    self.expiration     = object.expiration;

    self.numFavorites   = object.numFavorites;

    self.myFavorite     = object.myFavorite;

    return object;
}

@end
