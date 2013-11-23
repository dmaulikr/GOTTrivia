//
//  SettingsViewController.h
//  GOTTrivia
//
//  Created by James Hicklin on 11/21/2013.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *themeTitleLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *themeSeg;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

- (IBAction)changeTheme:(id)sender;

@end
