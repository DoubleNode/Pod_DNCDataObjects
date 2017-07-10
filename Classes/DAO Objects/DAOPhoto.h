//
//  DAOPhoto.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOFavorite;
@class DAOItem;
@class DAOLocation;
@class DAOMessage;
@class DAOReview;
@class DAOUser;

@interface DAOPhoto : DAOBase

+ (instancetype)photo;

- (BOOL)isEqualToPhoto:(DAOPhoto*)object;

@property (nonatomic, copy) NSString*   url;
@property (nonatomic, copy) NSString*   url_preload;
@property (nonatomic, copy) NSString*   comment;

@property (nonatomic, strong)   id  file;

@property (nonatomic, copy) NSString*       userId;
@property (nonatomic, copy) DAOUser*        user;

@property (nonatomic, copy) NSString*       categoryId;
@property (nonatomic, copy) DAOCategory*    category;

@property (nonatomic, copy) NSString*       itemId;
@property (nonatomic, copy) DAOItem*        item;

@property (nonatomic, copy) NSString*       locationId;
@property (nonatomic, copy) DAOLocation*    location;

@property (nonatomic, copy) NSString*       messageId;
@property (nonatomic, copy) DAOMessage*     message;

@property (nonatomic, copy) NSString*       reviewId;
@property (nonatomic, copy) DAOReview*      review;

@property (nonatomic, copy) NSNumber*       numFavorites;

@property (nonatomic, copy) DAOFavorite*    myFavorite;

@end
