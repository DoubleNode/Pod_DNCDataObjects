//
//  DAOAuth.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "DAOAuth.h"

@implementation DAOAuth

#pragma mark - Object lifecycle

+ (instancetype)auth   {   return [self.class.alloc init];  }

+ (instancetype)copyFrom:(DAOAuth*)object
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
    
    return [self isEqualToAuth:object];
}

- (BOOL)isEqualToAuth:(DAOAuth*)object
{
    if (![super isEqualToBase:object])  {   return NO;  }
    
    if (![object.type isEqualToString:self.type])       {   return NO;  }
    if (![object.token isEqualToString:self.token])     {   return NO;  }
    
    if (![object.bucketId isEqualToString:self.bucketId])       {   return NO;  }
    if (![object.bucketName isEqualToString:self.bucketName])   {   return NO;  }
    
    if (![object.accountId isEqualToString:self.accountId])             {   return NO;  }
    if (![object.apiUrl isEqualToString:self.apiUrl])                   {   return NO;  }
    if (![object.downloadUrl isEqualToString:self.downloadUrl])         {   return NO;  }
    if (![object.minimumPartSize isEqualToNumber:self.minimumPartSize]) {   return NO;  }
    
    if (![object.userId isEqualToString:self.userId])   {   return NO;  }
    
    return YES;
}

- (id)updateWith:(DAOAuth*)object
{
    [super updateWith:object];
    
    self.type       = object.type;
    self.token      = object.token;
    
    self.bucketId   = object.bucketId;
    self.bucketName = object.bucketName;
    
    self.accountId          = object.accountId;
    self.apiUrl             = object.apiUrl;
    self.downloadUrl        = object.downloadUrl;
    self.minimumPartSize    = object.minimumPartSize;
    
    if (self.user || (self.userId && ![self.userId isEqualToString:object.userId]))
    {
        self.user   = object.user;
    }
    self.userId = self.userId;
    
    return self;
}

@end
