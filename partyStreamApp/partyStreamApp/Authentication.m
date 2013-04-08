//
//  Authentication.m
//  partyStreamApp
//
//  This class will be used to authenticate the user with the backend
//  It will store the user's token after authenticating
//
//  Created by Salvatore D'Agostino on 2013-02-27.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import "Authentication.h"

@implementation Authentication

// Class Variables
@synthesize token,username,password;

-(id)init
{
    if (self = [super init])
    {
        username = @"";
        password = @"";
        token    = @"";
    }
    return self;
}

-(void)dealloc
{
    // Should never be called.
}

// Methods
+(Authentication *)sharedAuthentication
{
    static Authentication *auth = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        auth = [[self alloc]init];
    });
    return auth;
}

- (BOOL)authenticateWithUsername:(NSString *)name
                     andPassword:(NSString *)pass
{
    // TODO Send request to backend to authenticate the user
    // TODO Store the token for use through the life of the app
    
    username = name;
    password = pass;
    
    token = @"GET TOKEN FROM BACKEND"; // TODO Get token from back-end
    
    NSLog(@"Authenticating User %@ with Password %@",username,password);
    return NO;
}

@end
