//
//  GameScene.m
//  Bubble Struggle
//
//  Created by David Rynn on 7/6/15.
//  Copyright (c) 2015 David Rynn. All rights reserved.
//

#import "GameScene.h"
#import "BubbleNode.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    /* Setup your scene here */
    CGPoint centerScreen = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"bubble"];
    background.position =centerScreen;
    [self addChild:background];
    
    
    
    [self generateBubble];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}



-(void)generateBubble{
    BubbleNode *bubble = [[BubbleNode alloc]init];
    //Generate bubble at a specificPosition
    [self addChild:[bubble bubbleAtPosition:CGPointMake([self generateRandomFloatBetween:400 and:600], 300)]];
}


-(CGFloat)generateRandomFloatBetween:(NSInteger) firstNumber and:(NSInteger)secondNumber{
    return (CGFloat)(firstNumber + arc4random_uniform((u_int32_t)secondNumber - (u_int32_t)firstNumber + 1));
}




-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
