//
//  Agent.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 01/07/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Agent : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * destructionPower;
@property (nonatomic, retain) NSNumber * motivation;
@property (nonatomic, retain) NSNumber * assessment;
@property (nonatomic, retain) NSString * pictureURL;

@end
