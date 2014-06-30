//
//  Agent+Model.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 01/07/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "Agent+Model.h"
NSString *const agentPropertyDestructionPower = @"destructionPower";
NSString *const agentPropertyMotivation = @"motivation";
NSString *const agentPropertyAssessment = @"assessment";

@implementation Agent (Model)

- (NSNumber *)assessment{
    
    [self willChangeValueForKey:@"assessment"];
    NSUInteger destroyPower = [self.destructionPower unsignedIntegerValue];
    NSUInteger motivation = [self.motivation unsignedIntegerValue];
    NSUInteger assessment = (destroyPower + motivation) / 2;
    return @(assessment);
    [self didChangeValueForKey:@"assessment"];
}

- (void) setDestructionPower:(NSNumber *)destructionPower {
    [self willChangeValueForKey:agentPropertyDestructionPower];
    [self setPrimitiveValue:destructionPower forKey:agentPropertyDestructionPower];
    [self didChangeValueForKey:agentPropertyDestructionPower];
    [self updateAssessmentValue];
}


- (void) setMotivation:(NSNumber *)motivation {
    [self willChangeValueForKey:agentPropertyMotivation];
    [self setPrimitiveValue:motivation forKey:agentPropertyMotivation];
    [self didChangeValueForKey:agentPropertyMotivation];
    [self updateAssessmentValue];
}

- (void) updateAssessmentValue {
    [self willChangeValueForKey:agentPropertyAssessment];
    NSUInteger destroyPower = [self.destructionPower unsignedIntegerValue];
    NSUInteger motivation = [self.motivation unsignedIntegerValue];
    NSUInteger assessment = (destroyPower + motivation) / 2;
    [self setPrimitiveValue:@(assessment) forKey:agentPropertyAssessment];
    [self didChangeValueForKey:agentPropertyAssessment];
    
}


@end
