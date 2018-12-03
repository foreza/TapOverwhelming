//
//  GameManager.h
//  TapOverwhelming
//
//  Created by Jason C on 11/30/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#ifndef GameManager_h
#define GameManager_h

#import <Foundation/Foundation.h>


@interface GameManager : NSObject

@property (nonatomic, assign) float counter;
@property (nonatomic, assign) float highScore;
//@property (nonatomic, assign) BOOL sessionActive;

+ (id)sharedInstance;


- (void) incrementCounter;
- (float) getCounter;
- (void) resetCounter;
- (void) updateHighScore;
- (float) returnHighScore;


@end



#endif /* GameManager_h */
