//
//  SettingsViewController.m
//  GOTTrivia
//
//  Created by James Hicklin on 11/21/2013.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "SettingsViewController.h"

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize titleLabel;
@synthesize themeTitleLabel;
@synthesize themeSeg;
@synthesize backgroundImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL) prefersStatusBarHidden
{
  return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  if (IDIOM == IPAD) {
    [titleLabel setFont:[UIFont fontWithName:@"Game Of Thrones" size:65]];
    [themeTitleLabel setFont:[UIFont fontWithName:@"Game Of Thrones" size:35]];
  }
  else {
    [titleLabel setFont:[UIFont fontWithName:@"Game Of Thrones" size:37]];
    [themeTitleLabel setFont:[UIFont fontWithName:@"Game Of Thrones" size:20]];
  }
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *theme = [defaults stringForKey:@"theme"];
  NSInteger segmentIndex = [self getIndex:theme];
  [themeSeg setSelectedSegmentIndex:segmentIndex];
  [backgroundImage setImage:[UIImage imageNamed:theme]];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeTheme:(id)sender {
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *theme = [self getTheme: [themeSeg selectedSegmentIndex]];
  [defaults setObject:theme forKey:@"theme"];
  
  [backgroundImage setImage:[UIImage imageNamed:[defaults stringForKey:@"theme"]]];
  
}

-(NSInteger)getIndex:(NSString*)theme {
  
  if ([theme  isEqual: @"starkB.png"])
    return 0;
  else if ([theme  isEqual: @"lannisterB.png"])
    return 1;
  else if ([theme  isEqual: @"baratheonB.png"])
    return 2;
  else if ([theme  isEqual: @"martellB.png"])
    return 3;
  else
    return 0;
}

-(NSString*)getTheme:(NSInteger) index {
  
  switch (index) {
    case 0:
      return @"starkB.png";
      break;
    case 1:
      return @"lannisterB.png";
      break;
    case 2:
      return @"baratheonB.png";
      break;
    case 3:
      return @"martellB.png";
      break;
    default:
      return @"starkB.png";
      break;
  }
  
}
@end
