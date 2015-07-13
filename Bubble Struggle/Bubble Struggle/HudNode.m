//
//  HudNode.m
//  Bubble Struggle
//
//  Created by David Rynn on 7/12/15.
//  Copyright (c) 2015 David Rynn. All rights reserved.
//

#import "HudNode.h"

@implementation HudNode
+ (instancetype) hudAtPosition:(CGPoint)position inFrame:(CGRect)frame {
    HudNode *hud = [self node];
    hud.position = position;
    hud.zPosition = 10;
    hud.name = @"HUD";
    
    
    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    scoreLabel.name = @"Score";
    scoreLabel.text = @"0";
    scoreLabel.fontSize = 24;
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    scoreLabel.position = CGPointMake(frame.size.width-20, -10);
    scoreLabel.zPosition =100;
    [hud addChild:scoreLabel];
    
    SKLabelNode *timeLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    timeLabel.name = @"Time";
    timeLabel.text = @"0:00";
    timeLabel.fontSize = 24;
    timeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    timeLabel.position = CGPointMake(20, -10);
    [hud addChild:timeLabel];
    
    
    
    return hud;
}

- (void) addPoints:(NSInteger)points {
    self.score += points;
    
    SKLabelNode *scoreLabel = (SKLabelNode*)[self childNodeWithName:@"Score"];
    scoreLabel.text = [NSString stringWithFormat:@"%d",self.score];
    
}
- (void) addTimeInterval:(NSTimeInterval) t {
    
    NSInteger seconds = (NSInteger)t%60;
    NSInteger minutes = (NSInteger)t/60;
    SKLabelNode *timeLabel = (SKLabelNode*)[self childNodeWithName:@"Time"];
    timeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld",minutes, seconds];
    
}

@end
