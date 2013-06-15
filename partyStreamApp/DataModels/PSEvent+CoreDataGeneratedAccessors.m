//
//  PSEvent+CoreDataGeneratedAccessors.m
//  partyStreamApp
//
//  Created by Mike De Wolfe on 2013-06-15.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import "PSEvent.h"
#import "PSResponse.h"

@implementation PSEvent (CoreDataGeneratedAccessors)

-(void)addResponsesObject:(PSResponse *)value {
    if ( ! [self.responses containsObject:value] ) {
        PSDLog( @"Will Attempt to add response:\n%@", value.debugDescription );
        
        NSMutableSet *temp = [[NSMutableSet alloc] initWithSet:self.responses];
        [temp addObject:value];
        
        [self willChangeValueForKey:@"responses"];
        self.responses = [[NSSet alloc] initWithSet:temp];
        [self didChangeValueForKey:@"responses"];
    }
    
    PSDLog( @"Responses:\n%@", self.responses.debugDescription );
}

-(void)removeResponsesObject:(PSResponse *)value {
    if ( [self.responses containsObject:value] ) {
        PSDLog( @"Removing Response:\n%@", value.debugDescription );
        NSMutableSet *temp = [[NSMutableSet alloc] initWithSet:self.responses];
        [temp removeObject:value];
        
        [self willChangeValueForKey:@"responses"];
        self.responses = [[NSSet alloc] initWithSet:temp];
        [self didChangeValueForKey:@"responses"];
    }
    
    PSDLog( @"Responses:\n%@", self.responses.debugDescription );
}

-(void)addResponses:(NSSet *)values {
    PSDLog( @"Attempting to add responses:\n%@", values.debugDescription );
    
//    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
//    
//    for ( id item in values ) {
//        if ( [self.responses containsObject:item] )
//            [tempArray addObject:item];
//    }
//    
//    if ( tempArray.count > 0 ) {
//        NSMutableSet *temp = [[NSMutableSet alloc] initWithSet:self.responses];
//        [temp addObjectsFromArray:tempArray];
//        
//        [self willChangeValueForKey:@"responses"];
//        self.responses = [[NSSet alloc] initWithSet:temp];
//        [self didChangeValueForKey:@"responses"];
//    }
    for ( id item in values ) {
        if ( [item isKindOfClass:[PSResponse class]] )
            [self addResponsesObject:item];
    }
}

-(void)removeResponses:(NSSet *)values {
    PSDLog( @"Attempting to remove responses:\n%@", values.debugDescription );
    
    for ( id item in values ) {
        if ( [item isKindOfClass:[PSResponse class]] )
            [self removeResponsesObject:item];
    }
}

@end
