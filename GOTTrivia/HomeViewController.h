//
//  HomeViewController.h
//  GOTTrivia
//
//  Created by James Hicklin on 11/21/2013.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

- (IBAction)newGameClick:(id)sender;
- (IBAction)settingsClick:(id)sender;

@end
