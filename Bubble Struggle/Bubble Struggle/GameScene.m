//
//  GameScene.m
//  Bubble Struggle
//
//  Created by David Rynn on 7/6/15.
//  Copyright (c) 2015 David Rynn. All rights reserved.
//

#import "GameScene.h"
#import "BubbleNode.h"
#import "GroundNode.h"
#import "Utility.h"
#import <AVFoundation/AVFoundation.h>


#define ARC4RANDOM_MAX      0x100000000
@interface GameScene ()
@property (nonatomic, assign) NSUInteger *timeInterval;

@end


@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    /* Setup your scene here */
    CGPoint centerScreen = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"bubble"];
    background.position =centerScreen;
    self.physicsWorld.contactDelegate = self;
    [self addChild:background];
    
    GroundNode *ground = [GroundNode groundWithSize:CGSizeMake(self.frame.size.width, 22)];
    ground.zPosition = 15;
    
    self.physicsWorld.gravity = CGVectorMake(0, -0.6);
    
    [self addChild:ground];
    
//
//    //Setup a LightNode
//    SKLightNode* light = [[SKLightNode alloc] init];
//    light.categoryBitMask = 1;
//    light.falloff = 1;
//    light.ambientColor = [UIColor whiteColor];
//    light.lightColor = [[UIColor alloc] initWithRed:1.0 green:1.0 blue:0.0 alpha:0.5];
//    light.shadowColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
//    [self addChild:light];
    
    
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
    
//    [self spawnBubbleWithInterval];

}

    
-(void)update:(CFTimeInterval)currentTime {
    if ((int)(self.timeInterval)%100==0) {

        [self spawnBubbleWithInterval];
    }
    self.timeInterval ++;

    
  
}
- (void) didBeginContact:(SKPhysicsContact *)contact{
    NSLog(@"Contact!!");
    SKPhysicsBody *firstBody, *secondBody;

    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask ) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    NSLog(@"firstBody desc = %@", firstBody.description);
    if ( firstBody.categoryBitMask == CollisionCategoryBubble &&
        secondBody.categoryBitMask == CollisionCategoryGround ) {
        NSLog(@"Hit ground!");
        
      //  BubbleNode *bubble = (BubbleNode *) firstBody.node;

        
//        [self runAction:self.damageSFX];
//        THSpaceDogNode *spaceDog = (THSpaceDogNode *)firstBody.node;
//        [spaceDog removeFromParent];
        
 //       [self loseLife];
    }
    
//    [self createDebrisAtPosition:contact.contactPoint];


}

-(void)generateBubble{
    
    
    
    BubbleNode *bubble = [[BubbleNode alloc] init];
//    float dy = [Utility randomIntegerBetweenAndIncluding:100 maximum:400];
    bubble.physicsBody.velocity = CGVectorMake(0, 1000);
    
    float y = self.frame.size.height + bubble.size.height;
                float x = [Utility randomIntegerBetweenAndIncluding:bubble.size.width+10 maximum:self.frame.size.width-bubble.size.width-10];
    
   // bubble.position = CGPointMake(x,y);
    [self addChild:[bubble bubbleAtPosition:CGPointMake(x, y)]];
    
    
//    BubbleNode *bubble = [[BubbleNode alloc]init];
//    //Generate bubble at a specificPosition
//    
//
//    [self addChild:[bubble bubbleAtPosition:CGPointMake([self generateRandomFloatBetween:320 and: self.size.width - 320], self.size.height + 10)]];


}


-(CGFloat)generateRandomFloatBetween:(NSInteger) firstNumber and:(NSInteger)secondNumber{
     return floorf(((double)arc4random() / ARC4RANDOM_MAX) * (secondNumber - firstNumber) + firstNumber);
}

-(void)spawnBubbleWithInterval
{
    [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction performSelector:@selector(generateBubble) onTarget:self], [SKAction waitForDuration:5.0]]]] withKey:@"generateBubble" ];
}
    
@end