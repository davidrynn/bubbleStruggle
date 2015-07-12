//
//  SideNode.m
//  Bubble Struggle
//
//  Created by David Rynn on 7/11/15.
//  Copyright (c) 2015 David Rynn. All rights reserved.
//

#import "SideNode.h"
#import "Utility.h"

@implementation SideNode
+ (instancetype) sideWithSize:(CGSize)size leftSide: (BOOL) left{



    SideNode *side = [self spriteNodeWithColor:[SKColor greenColor] size:size];
    side.size = CGSizeMake(size.width/5, size.height);
    if (left) {
        side.name = @"LeftSide";
        side.position = CGPointMake(- side.size.width*.4,size.height/2);
    }
    else{
    side.name = @"RightSide";
        side.position = CGPointMake(size.width+ side.size.width*.4,size.height/2);

        side.color = [SKColor blueColor];
    }

    [side setupPhysicsBody];
    
    return side;
}


- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    self.physicsBody.categoryBitMask = CollisionCategorySide;
    //        self.physicsBody.collisionBitMask = CollisionCategoryDebris;
    //        self.physicsBody.contactTestBitMask = CollisionCategoryEnemy;
}




@end
