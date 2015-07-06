//
//  BubbleNode.m
//  Bubble Struggle
//
//  Created by David Rynn on 7/6/15.
//  Copyright (c) 2015 David Rynn. All rights reserved.
//

#import "BubbleNode.h"

@implementation BubbleNode
+(instancetype)bubbleAtPosition: (CGPoint) position {
    BubbleNode *bubble = [self spriteNodeWithImageNamed:@"bubble_sml_1"];
    bubble.position = position ;
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"bubble_sml_1"],[SKTexture textureWithImageNamed:@"bubble_sml_b"] ];
    SKAction *bubbleRotation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    SKAction *repeatRotation = [SKAction repeatActionForever:bubbleRotation];
    [bubble runAction:repeatRotation];
    
    return bubble;
    
}
@end
