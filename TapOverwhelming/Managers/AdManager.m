//
//  AdManager.m
//  TapOverwhelming
//
//  Created by Jason C on 12/3/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import "AdManager.h"

// Define our params here temporarily
NSString *const AppID = @"380000";
NSString *const InterstitialPLC = @"380003";

@implementation AdManager

+ (id)sharedInstance {
    static AdManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (id)init {
    if (self = [super init]) {
        NSLog(@"Admanager self = [super init]");
        
        // TODO: Init
    }
    return self;
}

// for V1 of AdManager, we'll just have the AerServ / InMobi SDK serve ads

// Init Ad SDKs
- (void) initializeAdSDK {
    
    NSLog(@"Admanager initializeAdSDK");
    [AerServSDK initializeWithAppID:AppID];

    //TODO: Handle GDPR
//    [AerServSDK initializeWithAppID:@"APP_ID" andGDPRUserConsent:YES];
}


- (void) preloadRewardedInterstitial:(id)context{
    
    NSLog(@"Admanager preloadRewardedInterstitial");
    self.asInterstitialVC = [ASInterstitialViewController viewControllerForPlacementID:InterstitialPLC withDelegate:context];
    [self.asInterstitialVC loadAd];
    
}

- (void) showRewardedInterstitial:(id)context{
    NSLog(@"Admanager showRewardedInterstitial");
    [self.asInterstitialVC showFromViewController:context];
}





@end
