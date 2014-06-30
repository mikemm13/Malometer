//
//  DetailViewController.h
//  Malometer
//
//  Created by Miguel Martin Nieto on 30/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailAgent;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
