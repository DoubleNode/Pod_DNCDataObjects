//
//  DAOSocialAccount.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOSocialAccount.h"

#import "DAOLocation.h"
#import "DAOUser.h"

@implementation DAOSocialAccount

#pragma mark - Object lifecycle

+ (instancetype)socialAccount   {   return [self.class.alloc init]; }

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
    if (![object isKindOfClass:self.class])
    {
        return NO;
    }
    
    return [self isEqualToSocialAccount:object];
}

- (BOOL)isEqualToSocialAccount:(DAOSocialAccount*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.locationId isEqualToString:self.locationId])   {   return NO;  }
    if (![object.userId isEqualToString:self.userId])           {   return NO;  }

    return YES;
}

- (id)copyWithZone:(NSZone*)zone
{
    typeof(self)    copy = [super copyWithZone:zone];
    
    copy.type       = self.type;
    copy.handle     = self.handle;
    copy.url        = self.url;
    
    if (self.location || ![copy.locationId isEqualToString:self.locationId])
    {
        copy.location  = self.location;
    }
    copy.locationId  = self.locationId;
    
    if (self.user || ![copy.userId isEqualToString:self.userId])
    {
        copy.user   = self.user;
    }
    copy.userId = self.userId;
    
    return copy;
}

@end
