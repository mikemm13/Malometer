//
//  DetailVCDelegate.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 30/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "DetailViewController.h"
@class AgentEditViewController;
@protocol DetailVCDelegate <NSObject>
- (void) dismissDetailViewController:(AgentEditViewController *)detailViewController modifiedData:(BOOL)modifiedData;

@end