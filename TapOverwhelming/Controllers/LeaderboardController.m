//
//  LeaderboardController.m
//  TapOverwhelming
//
//  Created by Jason C on 11/30/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import "LeaderboardController.h"

@interface LeaderboardController ()

@property (weak, nonatomic) IBOutlet UILabel *ScorePlaceholder;

@end

@implementation LeaderboardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    gm = [GameManager sharedInstance];      // Get the shared singleton instance
    
}

// Update this view every time we load it
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateScoreText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateScoreText {    
     _ScorePlaceholder.text = [NSString stringWithFormat:@"%0.0f", [gm returnHighScore]];
}

@end
