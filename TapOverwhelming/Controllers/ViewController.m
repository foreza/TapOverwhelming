//
//  ViewController.m
//  TapOverwhelming
//
//  Created by Jason C on 11/28/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import "ViewController.h"
//#import <AudioToolbox/AudioToolbox.h>
//#import <Foundation/Foundation.h>


@interface ViewController ()


@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    gm = [GameManager sharedInstance];      // Get the shared singleton instance
    am = [AdManager sharedInstance];          // Get the shared singleton instance
    
    
    

    
    [self.view addSubview:[am loadInFrame:self.view andShowBanner:self]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
