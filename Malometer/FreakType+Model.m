//
//  FreakType+Model.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 03/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "FreakType+Model.h"

@implementation FreakType (Model)

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
