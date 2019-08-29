//
//  DAOUser.h
//  DoubleNode Dsta Objects
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  DNCDataObjects is released under the MIT license. See LICENSE for details.
//

#import "__DAOBase.h"

@class DAOCategory;
@class DAOContact;
@class DAOFavorite;
@class DAOFollow;
@class DAOItem;
@class DAOLocation;
@class DAOPhoto;
@class DAOUserDevice;
@class DAOWishlist;

@interface DAOUser : DAOBase

+ (instancetype)user;
+ (instancetype)copyFrom:(DAOUser*)object;

- (BOOL)isEqualToUser:(DAOUser*)object;

- (id)updateWith:(DAOUser*)object;

@property (nonatomic, copy)     NSString*   email;
@property (nonatomic, copy)     NSString*   extUserID;

@property (nonatomic, copy)     NSString*       authSessionId;
@property (nonatomic, copy)     NSString*       authToken;
@property (nonatomic, copy)     NSDictionary*   authData;
@property (nonatomic, copy)     NSString*       authType;
@property (nonatomic, copy)     NSString*       username;
@property (nonatomic, copy)     NSString*       password;
@property (nonatomic, copy)     NSString*       security;

@property (nonatomic, copy)     NSString*       verifyKey;
@property (nonatomic, copy)     NSDate*         verifiedDate;

@property (nonatomic, copy)     NSString*       avatarId;
@property (nonatomic, copy)     DAOPhoto*       avatar;

@property (nonatomic, copy)     NSString*       contactId;
@property (nonatomic, copy)     DAOContact*     contact;

@property (nonatomic, copy)     NSString*       phoneNumber;
@property (nonatomic, copy)     NSString*       name;
@property (nonatomic, copy)     NSString*       handle;
@property (nonatomic, copy)     NSDate*         birthday;
@property (nonatomic, copy)     NSString*       location;
@property (nonatomic)           NSNumber*       rating;
@property (nonatomic, copy)     NSDictionary*   ratingTypes;

@property (nonatomic, assign, getter = isThisMe)    BOOL    me;

@property (nonatomic, copy)     NSNumber*   numUsersFollowing;
@property (nonatomic, copy)     NSNumber*   numUsersFollowers;

@property (nonatomic, copy)     NSNumber*   numCategoriesCheckins;
@property (nonatomic, copy)     NSNumber*   numCategoriesFavorites;
@property (nonatomic, copy)     NSNumber*   numCategoriesFollowers;
@property (nonatomic, copy)     NSNumber*   numCategoriesRatings;
@property (nonatomic, copy)     NSNumber*   numCategoriesReviews;
@property (nonatomic, copy)     NSNumber*   numCategoriesWishlists;

@property (nonatomic, copy)     NSNumber*   numItemsCheckins;
@property (nonatomic, copy)     NSNumber*   numItemsFavorites;
@property (nonatomic, copy)     NSNumber*   numItemsFollowers;
@property (nonatomic, copy)     NSNumber*   numItemsRatings;
@property (nonatomic, copy)     NSNumber*   numItemsReviews;
@property (nonatomic, copy)     NSNumber*   numItemsWishlists;

@property (nonatomic, copy)     NSNumber*   numLocationsCheckins;
@property (nonatomic, copy)     NSNumber*   numLocationsFavorites;
@property (nonatomic, copy)     NSNumber*   numLocationsFollowers;
@property (nonatomic, copy)     NSNumber*   numLocationsRatings;
@property (nonatomic, copy)     NSNumber*   numLocationsReviews;
@property (nonatomic, copy)     NSNumber*   numLocationsWishlists;

@property (nonatomic, copy)     NSMutableDictionary*    optionIds;
@property (nonatomic, copy)     NSMutableDictionary*    options;

@property (nonatomic, copy)     DAOFollow*  myFollow;

@property (nonatomic, copy) NSArray<DAOCategory*>*      categories;
@property (nonatomic, copy) NSArray<DAOContact*>*       contacts;
@property (nonatomic, copy) NSArray<DAOFavorite*>*      favorites;
@property (nonatomic, copy) NSArray<DAOItem*>*          items;
@property (nonatomic, copy) NSArray<DAOLocation*>*      locations;
@property (nonatomic, copy) NSArray<DAOWishlist*>*      wishlists;

@property (nonatomic, copy) NSArray<DAOUserDevice*>*    devices;

@end
