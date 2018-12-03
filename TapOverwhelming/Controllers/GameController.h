//
//  GameController.h
//  TapOverwhelming
//
//  Created by Jason C on 11/30/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"
#import "AdManager.h"

@interface GameController <ASInterstitialViewControllerDelegate> : UIViewController {
    GameManager *gm;
    AdManager *am;
    BOOL gameIsActive;
}

- (void)util_updateButtonText:(NSString*)text;

@end
