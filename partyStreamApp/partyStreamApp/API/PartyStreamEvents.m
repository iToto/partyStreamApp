//
//  PartyStreamEvents.m
//  partyStreamApp
//
//  Created by Salvatore D'Agostino on 2013-04-08.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import "PartyStreamEvents.h"

static PartyStreamEvents *defaultEvents = nil;

@implementation PartyStreamEvents

+ (PartyStreamEvents *)defaultEvents
{
    if (!defaultEvents) {
        defaultEvents = [[super allocWithZone:NULL]init];
    }
    return defaultEvents;
}

// Prevent creation of additional instances
+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultEvents];
}

- (id)init
{
    // If we already have an instance of PartyStreamEvents
    if (defaultEvents) {
        return defaultEvents;
    }
    
    self = [suer init];
    
    return self;
}
@end
