//
//  CeilingNode.m
//  Bubble Struggle
//
//  Created by David Rynn on 7/11/15.
//  Copyright (c) 2015 David Rynn. All rights reserved.
//

#import "CeilingNode.h"
#import "Utility.h"

@implementation CeilingNode

+ (instancetype) ceilingWithSize:(CGSize)size {
    CeilingNode *ceiling = [self spriteNodeWithColor:[SKColor whiteColor] size:size];
    ceiling.name = @"Ceiling";
    ceiling.position = CGPointMake(size.width/2,size.height*1.48);
    [ceiling setupPhysicsBody];
    
    return ceiling;
}


- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    self.physicsBody.categoryBitMask = CollisionCategoryCeiling;
    self.physicsBody.collisionBitMask = CollisionCategoryBubbleTypeB;
    self.physicsBody.contactTestBitMask = CollisionCategoryBubbleTypeB;
}
@end
