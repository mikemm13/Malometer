//
//  Power+Model.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 03/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "Power.h"

@interface Power (Model)

+ (Power *)fetchPowerInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name;
+ (instancetype)createPowerInMOC:(NSManagedObjectContext*)managedObjectContext withName:(NSString *)name;

@end
