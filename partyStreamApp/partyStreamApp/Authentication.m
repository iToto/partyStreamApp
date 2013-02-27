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


// Methods
- (BOOL)authenticateWithUsername:(NSString *)name andPassword:(NSString *)pass
{
    // TODO Send request to backend to authenticate the user
    // TODO Store the token for use through the life of the app
    
    return YES;
}

@end
