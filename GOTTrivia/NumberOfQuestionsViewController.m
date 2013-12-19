//
//  NumberOfQuestionsViewController.m
//  GOTTrivia
//
//  Created by James Hicklin on 11/28/2013.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "NumberOfQuestionsViewController.h"
#import "GameController.h"
#import "QuestionViewController.h"

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface NumberOfQuestionsViewController ()

@end

@implementation NumberOfQuestionsViewController

@synthesize backgroundImage;
@synthesize difficulty;
@synthesize titleLabel;
@synthesize numberOfQuestions;
@synthesize tenButton;
@synthesize twentyFiveButton;
@synthesize fiftyButton;
@synthesize allButton;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqual:@"beginGameSegue"]) {
    GameController *gc = [[GameController alloc] init:difficulty numberOfQuestions:numberOfQuestions];
    QuestionViewController *dest = segue.destinationViewController;
    dest.gameController = gc;
  }
  
}

- (IBAction)startGame:(id)sender {
  
  // initialize game controller

  if ([sender isEqual:tenButton]) {
    numberOfQuestions = 10;
  }
  else if ([sender isEqual:twentyFiveButton]) {
    numberOfQuestions = 25;
  }
  else if ([sender isEqual:fiftyButton]) {
    numberOfQuestions = 50;
  }
  else {
    numberOfQuestions = 0;
  }
  
  [self performSegueWithIdentifier:@"beginGameSegue" sender:self];
  
}
@end
