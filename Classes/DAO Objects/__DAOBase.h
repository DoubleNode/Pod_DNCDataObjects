//
//  __DAOBase.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAOUser;

@interface DAOBase : NSObject<NSCopying>

@property (nonatomic, copy) NSString*       id;

@property (nonatomic, copy) NSString*       _status;
@property (nonatomic, copy) NSError*        _statusError;
@property (nonatomic, copy) NSDate*         _created;
@property (nonatomic, copy) DAOUser*        _createdBy;
@property (nonatomic, copy) NSDate*         _synced;
@property (nonatomic, copy) NSDate*         _updated;
@property (nonatomic, copy) DAOUser*        _updatedBy;

- (BOOL)boolFromString:(NSString*)string;

- (NSDate*)dateFromNumber:(NSNumber*)number;
- (NSDate*)dateFromString:(NSString*)string;

- (NSString*)idFromString:(NSString*)string;

- (NSNumber*)numberFromNumber:(NSNumber*)number;
- (NSNumber*)numberFromString:(NSString*)string;
- (NSNumber*)numberFromString:(NSString*)string
               usingFormatter:(NSNumberFormatter*)numberFormatter;

- (int)intFromNumber:(NSNumber*)number;
- (int)intFromString:(NSString*)string;
- (int)intFromString:(NSString*)string
      usingFormatter:(NSNumberFormatter*)numberFormatter;

- (NSString*)stringFromFirebaseDate:(NSDate*)date;
- (NSString*)stringFromFirebaseTime:(NSDate*)time;
- (NSString*)stringFromString:(NSString*)string;

- (NSDate*)timeFromString:(NSString*)string;

- (NSString*)urlFromString:(NSString*)string;

- (NSMutableArray*)arrayFromJsonString:(NSString*)string;
- (NSMutableDictionary*)dictionaryFromJsonString:(NSString*)string;

- (NSString*)jsonStringFromArray:(NSArray*)array;
- (NSString*)jsonStringFromDictionary:(NSDictionary*)dictionary;

- (BOOL)isEqualToBase:(DAOBase*)object;

- (id)updateWith:(DAOBase*)object;

@end
