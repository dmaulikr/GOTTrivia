//
//  QuestionViewController.h
//  GOTTrivia
//
//  Created by James Hicklin on 11/29/2013.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"

@interface QuestionViewController : UIViewController <UIAlertViewDelegate>{
  GameController *gameController;
  GameQuestion *currentQuestion;
}

@property (strong, nonatomic) GameQuestion *currentQuestion;
@property (strong, nonatomic) GameController *gameController;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIButton *firstAnswerButton;
@property (strong, nonatomic) IBOutlet UIButton *secondAnswerButton;
@property (strong, nonatomic) IBOutlet UIButton *thirdAnswerButton;
@property (strong, nonatomic) IBOutlet UIButton *fourthAnswerButton;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UILabel *questionNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;

- (IBAction)giveUpGame:(id)sender;

-(void)setupCurrentQuestion;
-(void)deleteLastQuestion;

@end
