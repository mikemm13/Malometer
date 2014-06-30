//
//  MasterViewController.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 30/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import "DetailVCDelegate.h"

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, DetailVCDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
