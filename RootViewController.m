//
//  RootViewController.m
//  Tictactoe
//
//  Created by Julian Lee on 1/14/16.
//  Copyright © 2016 Le Mont. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onButtonTapped:(UIButton *)sender {
}



@end
