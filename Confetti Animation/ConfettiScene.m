//
//  ConfettiScene.m
//  Confetti Animation
//
//  Created by Ryan David Forsyth on 2019-10-29.
//  Copyright © 2019 Ryan F. All rights reserved.
//

#import "ConfettiScene.h"

@interface ConfettiScene()

@end

@implementation ConfettiScene


- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    self.scene.backgroundColor = UIColor.clearColor;
    
    [self setupConfetti];
}

-(void)setupConfetti
{
    SKEmitterNode *emitter = [NSKeyedUnarchiver unarchiveObjectWithFile: [[NSBundle mainBundle] pathForResource:@"Confetti" ofType:@"sks"]];
    
    NSArray <SKColor *> *colorArray = @[ SKColor.whiteColor, SKColor.blueColor, SKColor.redColor, SKColor.yellowColor, SKColor.greenColor, SKColor.orangeColor];
    
    emitter.position = CGPointMake(self.frame.size.width/2, self.frame.size.height);
    
    emitter.particleColorSequence = nil;

    emitter.particleColorBlendFactor = 100.0;
    
    [self addChild:emitter];
    
    SKAction *action = [SKAction runBlock:^{
        
        emitter.particleColor = [colorArray objectAtIndex: arc4random_uniform((uint32_t)colorArray.count)];
        
        emitter.particleAlpha = 1.0 - ((double)arc4random_uniform(5)/10.0); // Random 0.5-1.0

//        NSLog(@"%lu",(unsigned long)random);
    }];

    SKAction *wait = [SKAction waitForDuration:0.05];
    
    [self runAction: [SKAction repeatActionForever: [SKAction sequence:@[action,wait]]]];
    
}



@end
