//
//  PSEImageResponse.h
//  partyStreamApp
//
//  Created by Mike De Wolfe on 2013-06-14.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PSEImageResponse : NSManagedObject

@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * imageDescription;
@property (nonatomic, retain) NSString * name;

@end
