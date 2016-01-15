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
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pressedButtons = [NSMutableSet new];
    self.turn = 0;
    self.randomButtons = @[self.buttonOne, self.buttonTwo, self.buttonThree, self.buttonFour, self.buttonFive, self.buttonSix, self.buttonSeven, self.buttonEight, self.buttonNine];
}

- (IBAction)onButtonTapped:(UIButton *)sender {
    if (self.turn == 0) {
        NSString *identifier = [NSString stringWithFormat:@"%lu", (long)sender.tag];
        
        if (![self.pressedButtons containsObject:identifier]) {
            [sender setTitle:@"X" forState:normal];
            [self.pressedButtons addObject:identifier];
            NSLog(@"%@", sender.titleLabel.text);
            [self checkForWin];
            
            if ([self.pressedButtons count] < 9) {
                [self dumbassAI:sender];
            }
        }
    }
}

-(void)dumbassAI:(UIButton *)sender {
    int randomizer = arc4random_uniform(8);
    NSString *check = [NSString stringWithFormat:@"%i", randomizer];
    if ([self.pressedButtons containsObject:check]) {
        [self dumbassAI:sender];
    } else {
        [self.randomButtons[randomizer] setTitle:@"O" forState:normal];
        [self.pressedButtons addObject:check];
        [self checkForWin];
    }
}


- (void) checkForWin {
    NSLog(@"OMG THERE HAVE BEEN %lu BUTTONS PLAYED", (unsigned long)self.pressedButtons.count);
    int X = 0;
    int O = 0;
    int restartCheck = 0;
    NSArray *winSequences = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @0, @3, @6, @1, @4, @7, @2, @5, @8, @0, @4, @8, @2, @4, @6];
    for (NSNumber *box in winSequences) {
        int fixNumber = [box intValue];
        NSLog([[self.randomButtons[fixNumber] titleLabel] text]);
        restartCheck++;
        
        if ([[[self.randomButtons[fixNumber] titleLabel] text]  isEqual: [NSString stringWithFormat:@"X"]]) {
            X++;
            NSLog(@"%i, %i, %i", X, O, restartCheck);

        }
        else if([[[self.randomButtons[fixNumber] titleLabel] text]  isEqual: [NSString stringWithFormat:@"O"]])
        {
            O++;
            NSLog(@"%i, %i, %i", X, O, restartCheck);

        }
        if (X == 3) {
            self.whichPlayerLabel.text = @"X WINS!";
            self.turn = 1;
            X = 0;
            O = 0;
            restartCheck = 0;
            NSLog(@"%i, %i, %i", X, O, restartCheck);

            return;
        }
        else if (O == 3) {
            self.whichPlayerLabel.text = @"O WINS!";
            self.turn = 1;
            X = 0;
            O = 0;
            restartCheck = 0;
            NSLog(@"%i, %i, %i", X, O, restartCheck);

            return;
        }
        if (restartCheck == 3)
        {
            X = 0;
            O = 0;
            restartCheck = 0;
        }
        if (self.pressedButtons.count == 9) {
            self.whichPlayerLabel.text = @"IT'S A TIE!";
            return;
        }
        
    }
}


- (IBAction)startOverButton:(UIButton *)sender {
    for (int i = 0; i < 9; i++) {
        [self.randomButtons[i] setTitle:@" " forState:normal];
    }
    self.turn = 0;
    self.whichPlayerLabel.text = @"TIC TAC TOE";
    [self.pressedButtons removeAllObjects];
    NSLog(@"STARTED OVER");
    
}



@end
