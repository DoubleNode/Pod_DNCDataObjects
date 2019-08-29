//
//  DAONews.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
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

@property (nonatomic, copy) NSNumber*       numFavorites;

@property (nonatomic, copy) DAOFavorite*    myFavorite;

@end
