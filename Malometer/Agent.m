//
//  Agent.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 30/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "Agent.h"


@implementation Agent

@dynamic name;
@dynamic destructionPower;
@dynamic motivation;
@dynamic assessment;

- (NSNumber *)assessment{

    [self willChangeValueForKey:@"assessment"];
    return [NSNumber numberWithInt:([self.destructionPower intValue] + [self.motivation intValue])/2];
    [self didChangeValueForKey:@"assessment"];
}

+ (NSSet *)keyPathsForValuesAffectingAssessment{
    NSSet *keyPaths = [NSSet setWithObjects:@"destructionPower", @"motivation", nil];
    
    return keyPaths;
}



@end
