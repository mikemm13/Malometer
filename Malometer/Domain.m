//
//  Domain.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 01/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "Domain.h"
#import "Agent.h"


@implementation Domain

@dynamic name;
@dynamic agents;

+ (instancetype)createDomainInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name{
    Domain *domain = [NSEntityDescription insertNewObjectForEntityForName:@"Domain" inManagedObjectContext:managedObjectContext];
    domain.name = name;
    return domain;
}

+ (NSSet *)fetchDomainsInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Domain"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K==%@",@"name",name];
    fetchRequest.predicate = predicate;
    
    NSError *error;
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return results;
}

@end
