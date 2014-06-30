//
//  DetailViewController.m
//  Malometer
//
//  Created by Miguel Martin Nieto on 30/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "AgentEditViewController.h"
#import "Agent.h"

static NSArray *destructionValues;
static NSArray *motivationValues;
static NSArray *assessmentValues;

@interface AgentEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *assessment;
@property (weak, nonatomic) IBOutlet UILabel *destructionPowerValue;
@property (weak, nonatomic) IBOutlet UILabel *motivationValue;
@property (weak, nonatomic) IBOutlet UIStepper *destructionPowerStepper;

@property (weak, nonatomic) IBOutlet UIStepper *motivationStepper;


- (void)configureView;
@end

@implementation AgentEditViewController

#pragma mark - Managing the detail item

- (void)setDetailAgent:(id)detailAgent
{
    if (_detailAgent != detailAgent) {
        _detailAgent = detailAgent;
        
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
    
    self.assessment.text = assessmentValues[0];
    [self changeDestructionPowerValue];
    [self changeMotivationValue];

    self.motivationStepper.value = 0;
    self.destructionPowerStepper.value = 0;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.detailAgent addObserver:self forKeyPath:@"destructionPower" options:0 context:nil];
    [self.detailAgent addObserver:self forKeyPath:@"motivation" options:0 context:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.detailAgent removeObserver:self forKeyPath:@"destructionPower"];
    [self.detailAgent removeObserver:self forKeyPath:@"motivation"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"destructionPower"]) {
        [self changeDestructionPowerValue];
    } else if ([keyPath isEqualToString:@"motivation"]){
        [self changeMotivationValue];
    }
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelPressed:(id)sender {
    [self.delegate dismissDetailViewController:self modifiedData:NO];
}

- (IBAction)saveAgentInfo:(id)sender {
    self.detailAgent.name = self.nameTextField.text;
    [self.delegate dismissDetailViewController:self modifiedData:YES];
}

- (IBAction)destructionPowerChanged:(id)sender {
    NSNumber *stepperValue = [NSNumber numberWithFloat:self.destructionPowerStepper.value];
    self.detailAgent.destructionPower = stepperValue;
    NSNumber *returnedStepperValue = self.detailAgent.destructionPower;
    self.assessment.text = [NSString stringWithFormat:@"Destruction: %f", [returnedStepperValue floatValue]];
}

- (void)changeDestructionPowerValue{
    NSNumber *stepperValue = self.detailAgent.destructionPower;
    self.destructionPowerValue.text = destructionValues[[stepperValue intValue]];
    self.destructionPowerStepper.value = [stepperValue floatValue];
}

- (IBAction)motivationChanged:(id)sender {
    NSNumber *stepperValue = [NSNumber numberWithFloat:self.motivationStepper.value];
    self.detailAgent.motivation = stepperValue;
    NSNumber *returnedStepperValue = self.detailAgent.motivation ;
    self.assessment.text = [NSString stringWithFormat:@"Motivation: %f", [returnedStepperValue floatValue]];
    [self changeMotivationValue];
}

- (void)changeMotivationValue{
    
    NSNumber *stepperValue = self.detailAgent.motivation;
    self.motivationValue.text = motivationValues[[stepperValue intValue]];
    self.motivationStepper.value = [stepperValue floatValue];
}

@end
