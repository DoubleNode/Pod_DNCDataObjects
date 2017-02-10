//
//  DAOUser.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "__DAOBase.h"

@class DAOCategory;
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

@property (copy, nonatomic)     NSString*   email;
@property (copy, nonatomic)     NSString*   extUserID;

@property (copy, nonatomic)     NSString*       authSessionId;
@property (copy, nonatomic)     NSString*       authToken;
@property (copy, nonatomic)     NSDictionary*   authData;
@property (copy, nonatomic)     NSString*       authType;
@property (copy, nonatomic)     NSString*       username;
@property (copy, nonatomic)     NSString*       password;

@property (copy, nonatomic)     NSString*       verifyKey;
@property (copy, nonatomic)     NSDate*         verifiedDate;

@property (copy, nonatomic)     NSString*       avatarId;
@property (copy, nonatomic)     DAOPhoto*       avatar;

@property (copy, nonatomic)     NSString*   phoneNumber;
@property (copy, nonatomic)     NSString*   name;
@property (copy, nonatomic)     NSString*   handle;
@property (copy, nonatomic)     NSDate*     birthday;
@property (copy, nonatomic)     NSString*   location;

@property (nonatomic, assign, getter = isThisMe)    BOOL    me;

@property (copy, nonatomic)     NSNumber*   numUsersFollowing;
@property (copy, nonatomic)     NSNumber*   numUsersFollowers;

@property (copy, nonatomic)     NSNumber*   numCategoriesCheckins;
@property (copy, nonatomic)     NSNumber*   numCategoriesFavorites;
@property (copy, nonatomic)     NSNumber*   numCategoriesFollowers;
@property (copy, nonatomic)     NSNumber*   numCategoriesRatings;
@property (copy, nonatomic)     NSNumber*   numCategoriesReviews;
@property (copy, nonatomic)     NSNumber*   numCategoriesWishlists;

@property (copy, nonatomic)     NSNumber*   numItemsCheckins;
@property (copy, nonatomic)     NSNumber*   numItemsFavorites;
@property (copy, nonatomic)     NSNumber*   numItemsFollowers;
@property (copy, nonatomic)     NSNumber*   numItemsRatings;
@property (copy, nonatomic)     NSNumber*   numItemsReviews;
@property (copy, nonatomic)     NSNumber*   numItemsWishlists;

@property (copy, nonatomic)     NSNumber*   numLocationsCheckins;
@property (copy, nonatomic)     NSNumber*   numLocationsFavorites;
@property (copy, nonatomic)     NSNumber*   numLocationsFollowers;
@property (copy, nonatomic)     NSNumber*   numLocationsRatings;
@property (copy, nonatomic)     NSNumber*   numLocationsReviews;
@property (copy, nonatomic)     NSNumber*   numLocationsWishlists;

@property (copy, nonatomic)     NSMutableDictionary*    optionIds;
@property (copy, nonatomic)     NSMutableDictionary*    options;

@property (copy, nonatomic)     DAOFollow*  myFollow;

@property (nonatomic, copy) NSArray<DAOCategory*>*      categories;
@property (nonatomic, copy) NSArray<DAOFavorite*>*      favorites;
@property (nonatomic, copy) NSArray<DAOItem*>*          items;
@property (nonatomic, copy) NSArray<DAOLocation*>*      locations;
@property (nonatomic, copy) NSArray<DAOWishlist*>*      wishlists;

@property (nonatomic, copy) NSArray<DAOUserDevice*>*    devices;

@end
