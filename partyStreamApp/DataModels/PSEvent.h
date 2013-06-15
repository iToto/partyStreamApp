//
//  PSEvent.h
//  partyStreamApp
//
//  Created by Mike De Wolfe on 2013-06-15.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PSLocation, PSResponse;

@interface PSEvent : NSManagedObject

@property (nonatomic, retain) NSNumber * creationDate;
@property (nonatomic, retain) NSNumber * eventId;
@property (nonatomic, retain) NSNumber * lastModified;
@property (nonatomic, retain) NSString * mainImage;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * permission;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) PSLocation *location;
@property (nonatomic, retain) NSSet *responses;
@end

@interface PSEvent (CoreDataGeneratedAccessors)

- (void)addResponsesObject:(PSResponse *)value;
- (void)removeResponsesObject:(PSResponse *)value;
- (void)addResponses:(NSSet *)values;
- (void)removeResponses:(NSSet *)values;

@end
