//
//  NumberOfQuestionsViewController.h
//  GOTTrivia
//
//  Created by James Hicklin on 11/28/2013.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberOfQuestionsViewController : UIViewController {
  NSString *difficulty;
  NSInteger numberOfQuestions;
}

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) NSString *difficulty;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, assign) NSInteger numberOfQuestions;
@property (strong, nonatomic) IBOutlet UIButton *tenButton;
@property (strong, nonatomic) IBOutlet UIButton *twentyFiveButton;
@property (strong, nonatomic) IBOutlet UIButton *fiftyButton;
@property (strong, nonatomic) IBOutlet UIButton *allButton;

- (IBAction)startGame:(id)sender;
@end
