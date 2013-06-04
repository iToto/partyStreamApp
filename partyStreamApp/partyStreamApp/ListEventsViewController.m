//
//  ListEventsViewController.m
//  partyStreamApp
//
//  Created by Salvatore D'Agostino on 2013-04-07.
//  Copyright (c) 2013 Salvatore D'Agostino. All rights reserved.
//

#import "ListEventsViewController.h"
#import "Authentication.h"
#import "AppDelegate.h"
#import "PartyStreamEvents.h"

@interface ListEventsViewController ()

@end

@implementation ListEventsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    Authentication *auth = [Authentication sharedAuthentication];
    // Get all events before the view is loaded
    NSDictionary *events = [[PartyStreamEvents defaultEvents] getEventsWithAuthentication:auth];
    
    PSDLog( @"Events:\n%@", events.debugDescription );
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
