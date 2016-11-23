//
//  __DAOBase.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAOBase : NSObject<NSCopying>

@property (nonatomic, copy) NSString*       id;

@property (nonatomic, copy) NSString*       _status;
@property (nonatomic, copy) NSError*        _statusError;
@property (nonatomic, copy) NSDate*         _created;
@property (nonatomic, copy) NSDate*         _synced;
@property (nonatomic, copy) NSDate*         _updated;

- (BOOL)boolFromString:(NSString*)string;

- (NSDate*)dateFromString:(NSString*)string;

- (NSString*)idFromString:(NSString*)string;

- (NSNumber*)numberFromString:(NSString*)string;

- (NSNumber*)numberFromString:(NSString*)string
               usingFormatter:(NSNumberFormatter*)numberFormatter;

- (NSString*)stringFromString:(NSString*)string;

- (NSDate*)timeFromString:(NSString*)string;

- (NSString*)urlFromString:(NSString*)string;

- (BOOL)isEqualToBase:(DAOBase*)object;

- (id)updateWith:(DAOBase*)object;

@end
