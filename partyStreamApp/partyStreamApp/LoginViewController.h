//
//  LoginViewController.h
//  partyStreamApp
//
//  Created by Salvatore D'Agostino on 2013-02-26.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

- (IBAction)logUserIn:(id)sender;
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (strong, nonatomic) LoginViewController *viewController;
@end
