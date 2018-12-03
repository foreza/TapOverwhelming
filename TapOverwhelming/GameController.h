//
//  GameController.h
//  TapOverwhelming
//
//  Created by Jason C on 11/30/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"

@interface GameController : UIViewController {
    GameManager *gm;
    BOOL gameIsActive;
}

- (void)util_updateButtonText:(NSString*)text;

@end
