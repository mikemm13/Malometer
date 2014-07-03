//
//  Domain+Model.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 03/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "Domain.h"

@interface Domain (Model)
+ (instancetype) createDomainInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name;
+ (Domain *)fetchDomainInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name;
+ (NSFetchRequest *) fetchRequestControlledDomains;
@end
