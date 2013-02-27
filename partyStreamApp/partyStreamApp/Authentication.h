//
//  Authentication.h
//  partyStreamApp
//
//  Created by Salvatore D'Agostino on 2013-02-27.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Authentication : NSObject

// Class Variables
@property (nonatomic,readonly) NSString *token;
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *password;

// Class Methods
- (BOOL)authenticateWithUsername:(NSString *)name
                     andPassword:(NSString *)pass;

@end
