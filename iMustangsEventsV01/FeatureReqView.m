//
//  FeatureReqView.m
//  iMustangsEventsV01
//
//  Created by Jackson, Jacob on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeatureReqView.h"

@implementation FeatureReqView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [webSite addSubview:activityIndicator];
    [webSite loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"https://docs.google.com/spreadsheet/embeddedform?formkey=dG5qR3F5LW5EWFBnamtqUjBQZ1dHS0E6MQ"]]];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(loading) userInfo:nil repeats:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Feature Request";
}

- (void)viewDidUnload
{
       webSite = nil;
    activityIndicator = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)loading
{
    if(!webSite.loading)
        [activityIndicator stopAnimating];
    else {
        [activityIndicator startAnimating];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
