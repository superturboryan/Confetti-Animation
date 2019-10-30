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

@property (strong, nonatomic) IBOutlet UIView *youWinView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.skView.allowsTransparency = YES;
    
    self.youWinView.layer.cornerRadius = 15.0;
    
    [self loadEmptyScene];
    
    [self hideYouWin];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self revealYouWin];
}

-(void)hideYouWin {
    CGAffineTransform shrink = CGAffineTransformMakeScale(0, 0);
    CGAffineTransform down = CGAffineTransformMakeTranslation(0, 1500);
    CGAffineTransform downAndShrink = CGAffineTransformConcat(down, shrink);
    self.youWinView.transform = down;
}

-(void)revealYouWin {
    [UIView animateWithDuration:0.7
                          delay:1
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.3
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        
        self.youWinView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        return;
    }];
}

-(void)loadEmptyScene {
    SKScene *emptyScene = [[SKScene alloc]init];
    emptyScene.backgroundColor = UIColor.clearColor;
    [self.skView presentScene:emptyScene];
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
