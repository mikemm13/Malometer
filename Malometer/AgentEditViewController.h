//
//  DetailViewController.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 30/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailVCDelegate.h"
@class Agent;

@interface AgentEditViewController : UIViewController

@property (strong, nonatomic) Agent *detailAgent;
@property (weak, nonatomic) id<DetailVCDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
