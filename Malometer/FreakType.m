//
//  FreakType.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 01/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "FreakType.h"
#import "Agent.h"


@implementation FreakType

@dynamic name;
@dynamic agents;

+ (instancetype)createFreakTypeInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name{
    FreakType *freakType = [NSEntityDescription insertNewObjectForEntityForName:@"FreakType" inManagedObjectContext:managedObjectContext];
    freakType.name = name;
    return freakType;
}

+ (FreakType *)fetchFreakTypeInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"FreakType"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K==%@",@"name",name];
    fetchRequest.predicate = predicate;
    
    NSError *error;
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return [results lastObject];
}

@end
