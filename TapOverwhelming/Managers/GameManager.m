//
//  GameManager.m
//  TapOverwhelming
//
//  Created by Jason C on 11/30/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import "GameManager.h"


@implementation GameManager : NSObject


+ (id)sharedInstance {
    static GameManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (id)init {
    NSLog(@"GameManager init called");
    if (self = [super init]) {
        NSLog(@"GameManager self = [super init]");
        
        _counter = 0.0f;
        _highScore = 0.0f;
    }
    return self;
}

// counter methods

- (void) incrementCounter {
    NSLog(@"incrementCounter %0.0f", _counter);
    _counter += 1.0f;
}

- (float) getCounter{
    return _counter;
}

- (void) resetCounter{
    _counter = 0;
}


// high score methods

- (void) updateHighScore {
    if (_highScore < _counter){
        _highScore = _counter;
        NSLog(@"updateHighScore %0.0f", _highScore);
    }
}

- (float) returnHighScore {
    return _highScore;
}

@end
