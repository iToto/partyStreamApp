//
//  AppDelegate.h
//  partyStreamApp
//
//  Created by Salvatore D'Agostino on 2013-02-26.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LoginViewController;
@class Authentication;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LoginViewController *viewController;
@property (strong,nonatomic) Authentication *auth;

@end
