//
//  CategorySelectionViewController.m
//  GOTTrivia
//
//  Created by James Hicklin on 2013-11-21.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "DifficultySelectionViewController.h"
#import "NumberOfQuestionsViewController.h"

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface DifficultySelectionViewController ()

@end

@implementation DifficultySelectionViewController

@synthesize selectedDifficulty;
@synthesize titleLabel;
@synthesize backgroundImage;
@synthesize easyButton;
@synthesize mediumButton;
@synthesize hardButton;
@synthesize impossibleButton;


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

// unwind identifier
-(IBAction)unwindToDifficultySelection:(UIStoryboardSegue *)segue
{}

-(BOOL) prefersStatusBarHidden
{
  return YES;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqual:@"numberOfQuestionsSegue"]) {
    NumberOfQuestionsViewController *dest = segue.destinationViewController;
    dest.difficulty = selectedDifficulty;
  }
  
}

- (IBAction)selectedDifficulty:(id)sender {
  
  selectedDifficulty = [self getSelectedDifficulty:sender];
  [self performSegueWithIdentifier:@"numberOfQuestionsSegue" sender:self];
  
}

- (NSString*)getSelectedDifficulty:(id)button {
  
  if (button == easyButton)
    return @"Easy";
  else if (button == mediumButton)
    return @"Medium";
  else if (button == hardButton)
    return @"Hard";
  else
    return @"Impossible";
}


@end
