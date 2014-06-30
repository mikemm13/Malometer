//
//  DetailViewController.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 30/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "DetailViewController.h"

static NSArray *destructionValues;
static NSArray *motivationValues;
static NSArray *assessmentValues;

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *assessment;
@property (weak, nonatomic) IBOutlet UILabel *destructionPowerValue;
@property (weak, nonatomic) IBOutlet UILabel *motivationValue;
@property (weak, nonatomic) IBOutlet UIStepper *destructionPowerStepper;

@property (weak, nonatomic) IBOutlet UIStepper *motivationStepper;


- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    destructionValues = @[@"None",@"Little girl", @"Neutral", @"Killer", @"Massive destruction"];
    motivationValues = @[@"None", @"Bored", @"OK", @"Motivated", @"Very motivated"];
    assessmentValues = @[@"No Way", @"Better Not", @"Maybe", @"Yes", @"A Must"];
    
    self.assessment = assessmentValues[0];
    self.destructionPowerValue = destructionValues[0];
    self.motivationValue = motivationValues[0];
    self.motivationStepper.value = 0;
    self.destructionPowerStepper.value = 0;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
