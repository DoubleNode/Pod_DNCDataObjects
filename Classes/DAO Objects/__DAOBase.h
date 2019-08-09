//
//  __DAOBase.h
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

@import DNCore;
@import UIKit;

@class DAOUser;

@interface DAOBase : DNCDataTranslation<NSCoding, NSCopying>

@property (nonatomic, copy) NSString*       id;

@property (nonatomic, copy) NSString*       _status;
@property (nonatomic, copy) NSError*        _statusError;
@property (nonatomic, copy) NSDate*         _created;
@property (nonatomic, copy) DAOUser*        _createdBy;
@property (nonatomic, copy) NSDate*         _synced;
@property (nonatomic, copy) NSDate*         _updated;
@property (nonatomic, copy) DAOUser*        _updatedBy;

+ (NSArray*)propertyNames;

- (BOOL)isEqualToBase:(DAOBase*)object;

- (id)updateWith:(DAOBase*)object;

@end
