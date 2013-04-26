//
//  ViewController.m
//  EinstellungenTest
//
//  Created by Jonas Scharpf on 07.11.12.
//  Copyright (c) 2012 Jonas Scharpf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//int valueForField;  //Boolean Value of the Settings Switch
BOOL switchValue;
@synthesize label1; //Label to show the state of the switch

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadDefaults)
                                                 name:NSUserDefaultsDidChangeNotification
                                               object:nil];
    
    [self loadDefaults];    //executes 'loadDefaults' function
}

- (void) loadDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    switchValue = [defaults boolForKey:@"settingSwitch"]; //define which switch you mean

    //valueForField = [defaults boolForKey:@"settingSwitch"]; //define which switch you mean
    NSString *aString = [NSString stringWithFormat:@"%i", switchValue];   //converts state to a string

    if (switchValue) //the state of the switch is "ON"
    {
        label1.text = @"Hallo";
    }
    else    //the state of the switch is "OFF"
    {
        label1.text = @"";
    }
    //label1.text = aString;
    NSLog(@"Switch State is: %@", aString);  //prints out the state value of the switch
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Get user preference
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    switchValue = [defaults boolForKey:@"settingSwitch"];
    
    if (switchValue)
    {
        return YES;
    }
    else
    {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [label1 release];
    [super dealloc];
}
@end
