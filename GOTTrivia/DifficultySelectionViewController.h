//
//  CategorySelectionViewController.h
//  GOTTrivia
//
//  Created by James Hicklin on 11/21/2013.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DifficultySelectionViewController : UIViewController {
  NSString *selectedDifficulty;
}

@property (strong, nonatomic) NSString* selectedDifficulty;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIButton *easyButton;
@property (strong, nonatomic) IBOutlet UIButton *mediumButton;
@property (strong, nonatomic) IBOutlet UIButton *hardButton;
@property (strong, nonatomic) IBOutlet UIButton *impossibleButton;

- (IBAction)selectedDifficulty:(id)sender;


@end
