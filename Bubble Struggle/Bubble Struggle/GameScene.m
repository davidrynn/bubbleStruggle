//
//  GameScene.m
//  Bubble Struggle
//
//  Created by David Rynn on 7/6/15.
//  Copyright (c) 2015 David Rynn. All rights reserved.
//

#import "GameScene.h"
#import "BubbleNode.h"


#define ARC4RANDOM_MAX      0x100000000



@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    /* Setup your scene here */
    CGPoint centerScreen = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"bubble"];
    background.position =centerScreen;
    [self addChild:background];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    UITouch *touchedNode = [touches anyObject]; // Registers the touch
    CGPoint touchPoint = [touchedNode locationInNode:self]; // (x, y) of where the touch was
    SKNode *node = [self nodeAtPoint:touchPoint]; // Returns the node at touch

    NSLog(@"X: %f",touchPoint.x);
    NSLog(@"Y: %f",touchPoint.y);
    if ([node.name isEqualToString:@"bubbleNode"]){
            // do something with that node
            [node removeFromParent];
            NSLog(@"%@",node);
        }

}

    
-(void)update:(CFTimeInterval)currentTime {
    
    [self spawnBubbleWithInterval];
    
  
}


-(void)generateBubble{
    BubbleNode *bubble = [[BubbleNode alloc]init];
    //Generate bubble at a specificPosition
    

    [self addChild:[bubble bubbleAtPosition:CGPointMake([self generateRandomFloatBetween:320 and: self.size.width - 320], self.size.height + 10)]];


}


-(CGFloat)generateRandomFloatBetween:(NSInteger) firstNumber and:(NSInteger)secondNumber{
     return floorf(((double)arc4random() / ARC4RANDOM_MAX) * (secondNumber - firstNumber) + firstNumber);
}

-(void)spawnBubbleWithInterval
{
    [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction performSelector:@selector(generateBubble) onTarget:self], [SKAction waitForDuration:5.0]]]] withKey:@"generateBubble" ];
}
    
@end