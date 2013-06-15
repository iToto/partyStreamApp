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
    
    self = [super init];
    
    if (self) {
        events = [[NSDictionary alloc]init];
    }
    
    return self;
}

- (NSDictionary *)getEventsWithAuthentication:(Authentication *)auth
{
    // TODO Get events from API
    
    
    
    NSString *sampleJSON = @"["
    @"    {"
    @"        \"id\": 1,"
    @"        \"status\": \"0\","
    @"        \"name\": \"Winterfell\","
    @"        \"creator\": 2,"
    @"        \"date_created\": \"2012-11-17T06:11:57.102Z\","
    @"        \"last_modified\": \"2012-11-17T06:11:57.102Z\","
    @"        \"event_id\": 1,"
    @"        \"user_id\": 2,"
    @"        \"permission\": 2"
    @"    },"
    @"    {"
    @"        \"id\": 1,"
    @"        \"status\": \"0\","
    @"        \"name\": \"Winterfell\","
    @"        \"creator\": 2,"
    @"        \"date_created\": \"2012-11-17T06:11:57.102Z\","
    @"        \"last_modified\": \"2012-11-17T06:11:57.102Z\","
    @"        \"event_id\": 1,"
    @"        \"user_id\": 2,"
    @"        \"permission\": 2"
    @"    },"
    @"    {"
    @"        \"id\": 1,"
    @"        \"status\": \"0\","
    @"        \"name\": \"Winterfell\","
    @"        \"creator\": 2,"
    @"        \"date_created\": \"2012-11-17T06:11:57.102Z\","
    @"        \"last_modified\": \"2012-11-17T06:11:57.102Z\","
    @"        \"event_id\": 1,"
    @"        \"user_id\": 2,"
    @"        \"permission\": 2"
    @"    }"
    @"]";
    
    NSError *e = [[NSError alloc]init];

    events =
    [NSJSONSerialization JSONObjectWithData: [sampleJSON dataUsingEncoding:NSUTF8StringEncoding]
                                    options: NSJSONReadingMutableContainers
                                      error: &e];
    
    return events;
}


@end
