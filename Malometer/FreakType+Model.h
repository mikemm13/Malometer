//
//  FreakType+Model.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 03/07/14.
//  Copyright (c) 2014 PoWWaU. All rights reserved.
//

#import "FreakType.h"

@interface FreakType (Model)

+ (instancetype) createFreakTypeInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name;
+ (FreakType *)fetchFreakTypeInMOC:(NSManagedObjectContext *)managedObjectContext withName:(NSString *)name;
@end
