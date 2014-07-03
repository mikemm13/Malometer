//
//  AgentToAgentMigrationPolicy.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 03/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "AgentToAgentMigrationPolicy.h"
#import "Agent.h"
#import "Agent+Model.h"
#import "Power.h"
#import "Power+Model.h"

@implementation AgentToAgentMigrationPolicy

-(BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject *)sInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *__autoreleasing *)error{
    Agent *destinationInstance = [NSEntityDescription insertNewObjectForEntityForName:@"Agent" inManagedObjectContext:manager.destinationContext ];
    Agent *sourceInstance = (Agent *)sInstance;
    destinationInstance.name = sourceInstance.name;
    destinationInstance.destructionPower = sourceInstance.destructionPower;
    destinationInstance.motivation = sourceInstance.motivation;
    destinationInstance.pictureUUID = sourceInstance.pictureUUID;
    
    NSString *powerName = [sourceInstance valueForKey:@"power"];
    
    if (powerName) {
        Power *power = [Power fetchPowerInMOC:manager.destinationContext withName:powerName];
        if (!power) {
            power = [Power createPowerInMOC:manager.destinationContext withName:powerName];
        }
        [destinationInstance addPowersObject:power];
        
    }
    [manager associateSourceInstance:sInstance withDestinationInstance:destinationInstance forEntityMapping:mapping];
    
    return YES;
}

@end
