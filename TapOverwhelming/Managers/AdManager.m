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
NSString *const BottomBannerPLC = @"380000";
NSString *const MRECBannerPLC = @"380003";


#define kPredefinedBannerAdSize 60.0f

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




- (id) getBannerReference {
    return _asAdView;
}

- (id) loadInFrame:(UIView*)frame andShowBanner:(id)context{
    
    NSLog(@"Admanager loadAndShowBanner");
    self.asAdView = [ASAdView viewWithPlacementID:BottomBannerPLC andAdSize:ASBannerSize];
    self.asAdView.delegate = context;
    [self.asAdView loadAd];
    

    if(_asAdView != nil) {
        CGFloat viewWidth = 0.0f, viewHeight = 0.0f, xPosOffset = 0.0f, yPosOffset = -50.0f;
        if(kIS_iOS_11_OR_LATER) {
            xPosOffset = frame.safeAreaLayoutGuide.layoutFrame.origin.x;
            yPosOffset = frame.safeAreaLayoutGuide.layoutFrame.origin.y;
            viewWidth = frame.safeAreaLayoutGuide.layoutFrame.size.width;
            viewHeight = frame.safeAreaLayoutGuide.layoutFrame.size.height;
        } else {
            viewWidth = frame.frame.size.width;
            viewHeight = frame.frame.size.height;
        }
        
        CGFloat bannerFrameWidth = frame.frame.size.width;
        CGFloat xPos = (bannerFrameWidth > viewWidth) ? xPosOffset : xPosOffset + ((viewWidth - bannerFrameWidth)/2);
        CGFloat yPos = yPosOffset + viewHeight - kPredefinedBannerAdSize;
        _asAdView.frame = CGRectMake(xPos, yPos, bannerFrameWidth, kPredefinedBannerAdSize);
    
    

}
        return _asAdView;
}

- (void) preloadBanner:(id)context{
    
    NSLog(@"Admanager preloadBanner");
    self.asAdView = [ASAdView viewWithPlacementID:BottomBannerPLC andAdSize:ASBannerSize];
    self.asAdView.delegate = context;
    [self.asAdView loadAd];
    
}

- (void) showBanner:(id)context{
    NSLog(@"Admanager showBanner");
    
}





@end
