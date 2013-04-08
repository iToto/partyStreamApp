//
//  LoginViewController.m
//  partyStreamApp
//
//  Created by Salvatore D'Agostino on 2013-02-26.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import "LoginViewController.h"
#import "WebViewController.h"
#import "Authentication.h"
#import "AppDelegate.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
        
        // Call Login
        [self logUserIn:self];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (IBAction)logUserIn:(id)sender
{
    NSString *username = [[self txtUsername] text];
    NSString *password = [[self txtPassword] text];
    NSLog(@"Log User In here with name: %@ and password: %@",username,password);
    
    BOOL authenticated;
    
    authenticated = [[Authentication sharedAuthentication] authenticateWithUsername:username andPassword:password];
    
    NSLog(@"Response From Authenticate: %@", authenticated ? @"YES" : @"NO");
    
    if (authenticated) { // User is authenticated
        // TODO load Root Navigation Controller
    }
    else{ // Login Failed
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Incorrect Login"
                              message:@"Oops, looks like we couldn't authenticate you. Please try again"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)showRegisterView:(id)sender
{
    NSLog(@"Show Registration");
    WebViewController *wvc = [[WebViewController alloc] init];
    [self presentViewController:wvc animated:YES completion:nil];
}

@end
