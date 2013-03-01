//
//  Authentication.h
//  partyStreamApp
//
//  Created by Salvatore D'Agostino on 2013-02-27.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Authentication : NSObject
{
    NSString *token;
    NSString *username;
    NSString *password;
}

// Class Variables
@property (nonatomic,readonly) NSString *token;
@property (nonatomic,retain) NSString *username;
@property (nonatomic,retain) NSString *password;

// Class Methods
+(Authentication *)sharedAuthentication;

- (BOOL)authenticateWithUsername:(NSString *)name
                     andPassword:(NSString *)pass;
@end
