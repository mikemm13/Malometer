//
//  Domain+Model.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 03/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "Domain+Model.h"

@implementation Domain (Model)

+ (instancetype)createDomainInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name{
    Domain *domain = [NSEntityDescription insertNewObjectForEntityForName:@"Domain" inManagedObjectContext:managedObjectContext];
    domain.name = name;
    return domain;
}

+ (Domain *)fetchDomainInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Domain"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K==%@",@"name",name];
    fetchRequest.predicate = predicate;
    
    NSError *error;
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return [results lastObject];
}

+ (NSFetchRequest *) fetchRequestControlledDomains {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Domain"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"(SUBQUERY(agents,$x,$x.destructionPower >= 3)).@count > 1"];
    return fetchRequest;
}
@end
