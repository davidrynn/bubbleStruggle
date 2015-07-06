//
//  BubbleNode.m
//  Bubble Struggle
//
//  Created by David Rynn on 7/6/15.
//  Copyright (c) 2015 David Rynn. All rights reserved.
//

#import "BubbleNode.h"

@implementation BubbleNode

-(SKSpriteNode *)bubbleAtPosition:(CGPoint)position{
    
    SKSpriteNode *bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble_sml_1"];
    bubble.position = position;
    
    
    
    //Physics
    
    
    
    
    //Bubble Angle
//    [self randomBubbleAngle:bubble];
    //Bubble rotations
    [self randomBubbleRotation:bubble];
    [self randomBubbleScaling:bubble];
    
    
    
    
    return bubble;
}

//TO-DO RandomSize


-(void)randomBubbleAngle:(SKSpriteNode *)bubble{
    
    NSInteger angleInRad = arc4random_uniform(2 * M_PI);
    CGFloat angleInRadFloat = (CGFloat) angleInRad;
    SKAction *changeAngle = [SKAction rotateByAngle:angleInRadFloat duration:0];
    [bubble runAction:changeAngle];
    
}

-(void)randomBubbleRotation:(SKSpriteNode *)bubble{

    SKAction *rotation = [SKAction rotateByAngle: M_PI/16.0 duration:1.7];
    SKAction *reverseRotation = [SKAction rotateByAngle: - M_PI/16.0 duration:1.7];
    SKAction *repeatBubbleRotation = [SKAction repeatActionForever:[SKAction sequence:@[rotation,reverseRotation]]];
    [bubble runAction: repeatBubbleRotation];
    
}

-(void)randomBubbleScaling:(SKSpriteNode *)bubble{
    
    SKAction *scaleBubbleUp = [SKAction scaleXBy:1.05 y:1.05 duration:1.4];
    SKAction *scaleBubbleDown = [SKAction scaleXBy: 0.95 y: 0.95 duration:1.4];
    SKAction *repeatBubbleScaling = [SKAction repeatActionForever:[SKAction sequence:@[scaleBubbleUp,scaleBubbleDown]]];
    [bubble runAction:repeatBubbleScaling];

}









@end
