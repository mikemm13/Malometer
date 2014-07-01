//
//  Domain.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 01/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Agent;

@interface Domain : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *agents;
@end

@interface Domain (CoreDataGeneratedAccessors)

- (void)addAgentsObject:(Agent *)value;
- (void)removeAgentsObject:(Agent *)value;
- (void)addAgents:(NSSet *)values;
- (void)removeAgents:(NSSet *)values;

+ (instancetype) createDomainInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name;
+ (Domain *)fetchDomainInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name;
+ (NSFetchRequest *) fetchRequestControlledDomains;

@end
