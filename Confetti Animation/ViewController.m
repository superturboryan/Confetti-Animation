//
//  ViewController.m
//  Confetti Animation
//
//  Created by Ryan David Forsyth on 2019-10-29.
//  Copyright © 2019 Ryan F. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "ConfettiScene.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet SKView *skView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.skView.allowsTransparency = YES;
    
    [self playConfetti];
}

-(void)playConfetti {
    
    SKScene *confettiScene = [[ConfettiScene alloc] initWithSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    
//     confettiScene.scaleMode

    [(ConfettiScene*)confettiScene setupConfetti];
    
    [self.skView presentScene:confettiScene];
}

- (IBAction)pressConfettiButton:(id)sender {
    
    [self playConfetti];
}

@end
