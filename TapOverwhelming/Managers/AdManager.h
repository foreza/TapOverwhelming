//
//  AdManager.h
//  TapOverwhelming
//
//  Created by Jason C on 12/3/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#ifndef AdManager_h
#define AdManager_h

#import <Foundation/Foundation.h>
#import <AerServSDK/AerServSDK.h>       // AerServ / IM SDK


@interface AdManager: NSObject

// AerServ / IM ad views
@property(nonatomic, strong) ASAdView* asAdView; // for banner
 @property(nonatomic, strong) ASInterstitialViewController* asInterstitialVC;

// String constants
extern NSString *const AppID;
extern NSString *const InterstitialPLC;
extern NSString *const BottomBannerPLC;
extern NSString *const MRECBannerPLC;


+ (id)sharedInstance;
- (void)initializeAdSDK;


- (void) preloadRewardedInterstitial:(id)context;
- (void) showRewardedInterstitial:(id)context;

- (id) getBannerReference;
- (id) loadInFrame:(UIView*)frame andShowBanner:(id)context;
- (void) preloadBanner:(id)context;
- (void) showBanner:(id)context;

@end


#endif /* AdManager_h */
