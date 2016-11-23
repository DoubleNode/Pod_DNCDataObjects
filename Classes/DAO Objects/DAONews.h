//
//  DAONews.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOFavorite;

@interface DAONews : DAOBase

+ (instancetype)news;

- (BOOL)isEqualToNews:(DAONews*)object;

@property (nonatomic, copy) NSString*   title;
@property (nonatomic, copy) NSString*   body;
@property (nonatomic, copy) NSString*   bodyShort;

@property (nonatomic, copy) NSString*   imageUrl;

@property (nonatomic, copy) NSDate*     expiration;

@property (copy, nonatomic) NSNumber*       numFavorites;

@property (nonatomic, copy) DAOFavorite*    myFavorite;

@end
