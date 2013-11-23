//
//  CategorySelectionViewController.m
//  GOTTrivia
//
//  Created by James Hicklin on 2013-11-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "CategorySelectionViewController.h"

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface CategorySelectionViewController ()

@end

@implementation CategorySelectionViewController

@synthesize titleLabel;
@synthesize backgroundImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  if (IDIOM == IPAD) {
    [titleLabel setFont:[UIFont fontWithName:@"Game Of Thrones" size:65]];
  }
  else {
    [titleLabel setFont:[UIFont fontWithName:@"Game Of Thrones" size:37]];
  }
}

-(void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [backgroundImage setImage:[UIImage imageNamed:[defaults stringForKey:@"theme"]]];
}

-(BOOL) prefersStatusBarHidden
{
  return YES;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
