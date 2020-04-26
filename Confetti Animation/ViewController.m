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

@property (weak, nonatomic) IBOutlet UIImageView *gritCoinImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.skView.allowsTransparency = YES;
    
    self.gritCoinImageView.layer.cornerRadius = 15.0;
    
    [self loadEmptyScene];
    
    [self hideCoin];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self revealCoin];
}

-(void)hideCoin {
    CGAffineTransform shrink = CGAffineTransformMakeScale(0, 0);
    CGAffineTransform down = CGAffineTransformMakeTranslation(0, 1500);
    CGAffineTransform downAndShrink = CGAffineTransformConcat(down, shrink);
    self.gritCoinImageView.transform = down;
    
    self.gritCoinImageView.alpha = 0;
    
    self.gritCoinImageView.layer.masksToBounds = NO;
    self.gritCoinImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.gritCoinImageView.layer.shadowOpacity = 0.2;
    self.gritCoinImageView.layer.shadowOffset = CGSizeMake(0, 4.0);
    self.gritCoinImageView.layer.shadowRadius = 2.0;
}

-(void)revealCoin {
    [UIView animateWithDuration:1.2
                          delay:1
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.3
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        
        self.gritCoinImageView.alpha = 0.95;
        self.gritCoinImageView.transform = CGAffineTransformIdentity;
        
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
    
//     confettiScene.scaleMode =

//    CGPoint center = self.gritCoinImageView.center;
    
    [(ConfettiScene*)confettiScene addEmitterWithPosition: CGPointMake(self.view.frame.origin.x , 0) andAngle:80];
    [(ConfettiScene*)confettiScene addEmitterWithPosition: CGPointMake(self.view.frame.size.width , 0) andAngle:100];
    
    [self.skView presentScene:confettiScene];
}

- (IBAction)pressConfettiButton:(id)sender {
    
    [self playConfetti];
}

@end
