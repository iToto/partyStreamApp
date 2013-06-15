//
//  PSResponse.h
//  partyStreamApp
//
//  Created by Mike De Wolfe on 2013-06-15.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PSEvent;

@interface PSResponse : NSManagedObject

@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSNumber * responseId;
@property (nonatomic, retain) NSNumber * creation;
@property (nonatomic, retain) PSEvent *event;

@end
