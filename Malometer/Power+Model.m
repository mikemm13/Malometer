//
//  Power+Model.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 03/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "Power+Model.h"

@implementation Power (Model)

+ (Power *)fetchPowerInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Power"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K==%@",@"name",name];
    fetchRequest.predicate = predicate;
    
    NSError *error;
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return [results lastObject];
}

@end
