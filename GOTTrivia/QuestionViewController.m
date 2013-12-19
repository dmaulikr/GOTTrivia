//
//  QuestionViewController.m
//  GOTTrivia
//
//  Created by James Hicklin on 11/29/2013.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "QuestionViewController.h"
#import "NSString+fitFontToButton.h"
#import "NSMutableArray_Shuffling.h"

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@interface QuestionViewController ()

@end

@implementation QuestionViewController

@synthesize backgroundImage;
@synthesize gameController;
@synthesize currentQuestion;
@synthesize questionLabel;
@synthesize firstAnswerButton;
@synthesize secondAnswerButton;
@synthesize thirdAnswerButton;
@synthesize fourthAnswerButton;
@synthesize questionNumberLabel;
@synthesize timerLabel;

UIView *blackCover;
NSInteger timeLeft;
NSTimer *countdownTimer;
UIColor *blueTextColor;

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
    [self setBlueTextColor];
    self.timerLabel.textColor = blueTextColor;
}


-(void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  //NSLog([defaults stringForKey:@"theme"],nil);
  [backgroundImage setImage:[UIImage imageNamed:[defaults stringForKey:@"theme"]]];
  
  [self setupCurrentQuestion];
}

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self startCountdown:self];
}

-(void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  self.timerLabel.text = @"20";
  self.timerLabel.textColor = blueTextColor;
}

- (IBAction)startCountdown:(id)sender
{
  timeLeft = 20;
  
  countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                    target:self
                                                  selector:@selector(advanceTimer:)
                                                  userInfo:nil
                                                   repeats:YES];
  
}

- (void)advanceTimer:(NSTimer *)timer
{
  timeLeft -= 1;
  self.timerLabel.text = [NSString stringWithFormat:@"%d", timeLeft];
  if (timeLeft < 5) {
    __unused NSTimer *newTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(test:) userInfo:nil repeats:NO]; // __unused supresses the warning
    [self.timerLabel setHidden:YES];
    // [self.timerLabel setHidden:NO];
    self.timerLabel.textColor = [UIColor colorWithRed:154/255.0f green:26/255.0f blue:14/255.0f alpha:1.0f];
  }
  else
    self.timerLabel.textColor = blueTextColor;
  
  if (timeLeft <= 0) {
    gameController.questionNumber++;
    [self performSegueWithIdentifier:@"incorrectAnswerSegue" sender:self];
  }
}

-(void)test:(NSTimer *)timer {
  [self.timerLabel setHidden:NO];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  [countdownTimer invalidate];
  
}

-(void)setupCurrentQuestion {
  
  currentQuestion = [gameController fetchRandomQuestion];
  CGFloat fontSize;
  //questionLabel.text = [currentQuestion question];
  
  CGRect frame = questionLabel.frame;
  frame.size.width -= 25; //l + r padding
  frame.size.height -= 25;
  
  if (IDIOM == IPAD) {
    fontSize = [[currentQuestion question] fontSizeWithFont:[UIFont fontWithName:@"Game Of Thrones" size:50] constrainedToSize: frame.size];
    //questionLabel.font = [UIFont fontWithName:@"ParryHotter" size:40];
  }
  else {
    //questionLabel.font = [UIFont fontWithName:@"ParryHotter" size:20];
    fontSize = [[currentQuestion question] fontSizeWithFont:[UIFont fontWithName:@"Game Of Thrones" size:30] constrainedToSize: frame.size];
  }
  //questionLabel.font = [UIFont fontWithName:@"Harry P" size:fontSize];
  //questionLabel.adjustsFontSizeToFitWidth = YES;
  [questionLabel setFont:[UIFont fontWithName:@"Game Of Thrones" size:fontSize]];
  [questionLabel setText:[currentQuestion question]];
  NSMutableArray *buttonArray = [NSMutableArray arrayWithObjects:firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton, nil];
  [buttonArray shuffle];
  
  for (int i = 0; i < 4; i++) {
    [self setupButtonForAnswer:[[currentQuestion possibleAnswers] objectAtIndex:i] theButton:[buttonArray objectAtIndex:i]];
  }
  
  questionNumberLabel.text = [NSString stringWithFormat:@"%d/%d", [gameController questionNumber], [gameController numOfQuestions]];
  //  questionNumberLabel.font = [UIFont fontWithName:@"ParryHotter" size:50];
}


-(void)setupButtonForAnswer:(NSString*)answerString theButton:(UIButton*)theButton {
  
  theButton.titleLabel.textAlignment = NSTextAlignmentCenter;
  // [theButton.titleLabel sizeToFit];
  CGRect frame = theButton.frame;
  if (IDIOM == IPAD) {
    frame.size.width -= 55; //l + r padding
    frame.size.height -= 55;
  }
  else {
    frame.size.width -= 25; //l + r padding
    frame.size.height -= 25;
  }
  //theButton.titleLabel.frame = frame;
  //NSLog(answerString);
  //[theButton.titleLabel setFont:[UIFont fontWithName:@"harryp" size:25]];
  theButton.titleLabel.numberOfLines = 0;
  //theButton.titleLabel.adjustsFontSizeToFitWidth = YES;
  CGFloat fontSize;
  if (IDIOM == IPAD) {
    fontSize = [answerString fontSizeWithFont:[UIFont fontWithName:@"Game Of Thrones" size:44] constrainedToSize: frame.size];
  }
  else {
    fontSize = [answerString fontSizeWithFont:[UIFont fontWithName:@"Game Of Thrones" size:24] constrainedToSize: frame.size];
  }
  
  [theButton.titleLabel setFont:[UIFont fontWithName:@"Game Of Thrones" size:fontSize]];
  [theButton setTitle:answerString forState:UIControlStateNormal];
}



- (IBAction)giveUpGame:(id)sender {
  
  // create a view to cover up the current view.
  blackCover = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.y, self.view.frame.origin.x, self.view.frame.size.height, self.view.frame.size.width)];
  blackCover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.98];
  blackCover.opaque = YES;
  
  [self.view addSubview:blackCover];
  [self.view bringSubviewToFront:blackCover];
  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Are you sure you want to give up the game?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
  [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  
  if (buttonIndex == 0) {
    [blackCover removeFromSuperview];
  }
  else {
    [self performSegueWithIdentifier:@"unwindToMainMenu" sender:self];
  }
  
}

-(void)deleteLastQuestion {
  [[gameController allQuestions] removeObject:currentQuestion];
}

- (void)setBlueTextColor {
  if (!blueTextColor)
    blueTextColor = [UIColor colorWithRed:154/255.0f green:26/255.0f blue:14/255.0f alpha:1.0f];
}


@end
