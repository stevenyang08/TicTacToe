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
@property int turn;
@property NSArray *randomButtons;
@property NSMutableSet *pressedButtons;
@property NSMutableSet *winCheck;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pressedButtons = [NSMutableSet new];
    self.winCheck = [NSMutableSet new];
    self.turn = 0;
    self.randomButtons = @[self.buttonOne, self.buttonTwo, self.buttonThree, self.buttonFour, self.buttonFive, self.buttonSix, self.buttonSeven, self.buttonEight, self.buttonNine];
    //NSLog(@"%@", self.randomButtons);

}

- (IBAction)onButtonTapped:(UIButton *)sender {
    NSString *identifier = [NSString stringWithFormat:@"%lu", sender.tag];
    [sender setTitle:@"X" forState:normal];
    [self.pressedButtons addObject:identifier];
    [self.winCheck addObject:[identifier stringByAppendingString:@"X"]];
    
    
    
    if ([self.pressedButtons count] < 8) {
        [self dumbassAI:sender];
    }
    NSLog(@"%@", self.winCheck);
}

-(void)dumbassAI:(UIButton *)sender {
    
    int randomizer = arc4random_uniform(8);
    NSString *check = [NSString stringWithFormat:@"%i", randomizer];
    for (int i = 0; i < 1; i++) {
        if ([self.pressedButtons containsObject:check]) {
            [self dumbassAI:sender];
        } else {
            [self.randomButtons[randomizer] setTitle:@"O" forState:normal];
            [self.pressedButtons addObject:check];
            [self.winCheck addObject:[check stringByAppendingString:@"O"]];

        }
    }
}



@end
