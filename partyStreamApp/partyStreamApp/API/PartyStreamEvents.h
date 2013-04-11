//
//  PartyStreamEvents.h
//  partyStreamApp
//
//  Created by Salvatore D'Agostino on 2013-04-08.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Authentication.h"

@interface PartyStreamEvents : NSObject
{
        NSDictionary *events;
}

// Class Methods

+ (PartyStreamEvents *)defaultEvents;
- (NSDictionary *)getEventsWithAuthentication:(Authentication *)auth;

@end
