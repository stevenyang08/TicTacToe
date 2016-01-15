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
@property NSMutableArray *pressedButtons;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.turn = 0;
    self.randomButtons = @[self.buttonOne, self.buttonTwo, self.buttonThree, self.buttonFour, self.buttonFive, self.buttonSix, self.buttonSeven, self.buttonEight, self.buttonNine];
    //NSLog(@"%@", self.randomButtons);

}

- (IBAction)onButtonTapped:(UIButton *)sender {
    NSUInteger identifier = sender.tag;
    [sender setTitle:@"X" forState:normal];
    [self dumbassAI:sender];
    NSString *tagNum = [NSString stringWithFormat:@"%lu", sender.tag];
    [self.pressedButtons addObject:tagNum];
}

-(NSUInteger)dumbassAI:(UIButton *)sender {
    if (self.turn == 0) {
        int location = arc4random_uniform(8);
        NSString *check = [NSString stringWithFormat:@"%i", location];
        for (int i = 0; i < 1; i++) {
            if ([self.pressedButtons containsObject:check]) {
                i = 0;
            } else {
                
            }
        }
        NSLog(@"%@", [[[self.randomButtons objectAtIndex:location] titleLabel] text]);
    }
    return 1;
}



@end
