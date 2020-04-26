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
}

-(void)addEmitterWithPosition:(CGPoint)position andAngle:(CGFloat)angle
{
    SKEmitterNode *emitter = [NSKeyedUnarchiver unarchiveObjectWithFile: [[NSBundle mainBundle] pathForResource:@"ConfettiPop" ofType:@"sks"]];
    
    NSArray *colorArray =
    @[ [UIColor colorWithRed:204.0/255.0 green:23.0/255.0 blue:71.0/255.0 alpha:1] , // pinkRed
       [UIColor colorWithRed:255.0/255.0 green:164.0/255.0 blue:2.0/255.0 alpha:1], // yellowDark
       [UIColor colorWithRed:7.0/255.0 green:202.0/255.0 blue:196.0/255.0 alpha:1], // primary
       [UIColor colorWithRed:222.0/255.0 green:93.0/255.0 blue:0.0/255.0 alpha:1], // yellowOrange
       [UIColor colorWithRed:195.0/255.0 green:94.0/255.0 blue:232.0/255.0 alpha:1], // purple
       UIColor.whiteColor
    ];
    
    emitter.position = position;
    
    emitter.particleColorSequence = nil;

    emitter.particleColorBlendFactor = 1.0;
    
    emitter.emissionAngle = angle * M_PI / 180;
    
    [self addChild:emitter];
    
    SKAction *action = [SKAction runBlock:^{
        
        emitter.particleColor = [colorArray objectAtIndex: arc4random_uniform((uint32_t)colorArray.count)];
        
        emitter.particleAlpha = 1.0 - ((double)arc4random_uniform(2)/10.0); // Random 0.5-1.0

//        NSLog(@"%lu",(unsigned long)random);
    }];

    SKAction *wait = [SKAction waitForDuration:0.05];
    
    [self runAction: [SKAction repeatActionForever: [SKAction sequence:@[action,wait]]]];
    
}



@end
