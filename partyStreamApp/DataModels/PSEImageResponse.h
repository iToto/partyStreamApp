//
//  PSEImageResponse.h
//  partyStreamApp
//
//  Created by Mike De Wolfe on 2013-06-15.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "PSResponse.h"


@interface PSEImageResponse : PSResponse

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * path;

@end
