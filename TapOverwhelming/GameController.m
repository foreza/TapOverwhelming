//
//  GameController.m
//  TapOverwhelming
//
//  Created by Jason C on 11/30/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import "GameController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>


@interface GameController ()


// UI
@property (strong, nonatomic) IBOutlet UIView *TimeBar;
@property (weak, nonatomic) IBOutlet UIButton *TapZone;
@property (weak, nonatomic) IBOutlet UILabel *TitleText;
@property (weak, nonatomic) IBOutlet UILabel *CountAmtLabel;

@end

@implementation GameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    gm = [GameManager sharedInstance];      // Get the shared singleton instance

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_TapZone setEnabled:true];
    gameIsActive = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




// Function called to start the game
- (void)startGameRound{
    
    NSLog(@"startGameRound");
    gameIsActive = true;
    [gm resetCounter];
    
    // Start a timer for 10 seconds.
    [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(finishRound)
                                   userInfo:nil
                                    repeats:NO];
}


- (void)finishRound{
    [_TapZone setEnabled:false];
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    NSLog(@"Total taps: %f", [gm getCounter]);
    [gm updateHighScore];

}

- (void)updateTapTextWithCounter{
    _CountAmtLabel.text = [NSString stringWithFormat:@"%0.0f", [gm getCounter]];
}


- (void)util_updateButtonText:(NSString*)text{
    [_TapZone setTitle:text forState:UIControlStateNormal];
}



- (IBAction)OnTapZone:(id)sender {
    
     NSLog(@"OnTapZone");
    
    if (gameIsActive){
        NSLog(@"gameIsActive");
        [gm incrementCounter];
        [self updateTapTextWithCounter];
        return;
    }
    
    else if (!gameIsActive) {
        NSLog(@"gameIsNotActive");
        [self startGameRound];
        [self util_updateButtonText:@"TAP TAP GO GO"];
    }
   
    
}

@end
