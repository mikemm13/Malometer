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
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    self.nameTextField.delegate = self;
    
}

- (void)configureView
{
    // Update the user interface for the detail item.
    [self displayAgentName];
    [self initializeAssesmentView];
    [self initializeDestroyPowerViews];
    [self initializeMotivationViews];

    
}

- (void) initializeAssesmentView {
    assessmentValues = @[@"No way", @"Better not", @"Maybe", @"Yes", @"A must"];
    [self displayAssessmentLabel];
}

- (void) initializeDestroyPowerViews {
    destructionValues = @[@"Soft", @"Weak", @"Potential", @"Destroyer", @"Nuke"];
    [self initializeDestroyPowerStepper];
    [self displayDestructionPowerLabel];
}

- (void) initializeDestroyPowerStepper {
    self.destructionPowerStepper.value = [self.detailAgent.destructionPower doubleValue];
}

- (void) initializeMotivationViews {
    motivationValues = @[@"Doesn't care", @"Would like to", @"Quite focused", @"Interested", @"Goal"];
    [self initializeMotivationStepper];
    [self displayMotivationLabel];
}

- (void) initializeMotivationStepper {
    self.motivationStepper.value = [self.detailAgent.motivation doubleValue];
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self addObserverForProperties];
}

- (void)addObserverForProperties {
    [self.detailAgent addObserver:self forKeyPath:@"destructionPower" options:0 context:nil];
    [self.detailAgent addObserver:self forKeyPath:@"motivation" options:0 context:nil];
    [self.detailAgent addObserver:self forKeyPath:@"assessment" options:0 context:nil];
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self removeObserverForProperties];
}

- (void)removeObserverForProperties {
    [self.detailAgent removeObserver:self forKeyPath:@"destructionPower"];
    [self.detailAgent removeObserver:self forKeyPath:@"motivation"];
    [self.detailAgent removeObserver:self forKeyPath:@"assessment"];
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
    
}

- (IBAction)motivationChanged:(id)sender {
    NSNumber *stepperValue = [NSNumber numberWithFloat:self.motivationStepper.value];
    self.detailAgent.motivation = stepperValue;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"destructionPower"]) {
        [self displayDestructionPowerLabel];
    } else if ([keyPath isEqualToString:@"motivation"]){
        [self displayMotivationLabel];
    } else if ([keyPath isEqualToString:@"assessment"]){
        [self displayAssessmentLabel];
    }
    
}

- (void) displayAgentName {
    self.nameTextField.text = self.detailAgent.name;
}

- (void) displayDestructionPowerLabel {
    NSUInteger destructionPower = [self.detailAgent.destructionPower unsignedIntegerValue];
    self.destructionPowerValue.text = [destructionValues objectAtIndex:destructionPower];
}

- (void) displayMotivationLabel {
    NSUInteger motivation = [self.detailAgent.motivation unsignedIntegerValue];
    self.motivationValue.text = [motivationValues objectAtIndex:motivation];
}


- (void) displayAssessmentLabel {
    self.assessment.text = [assessmentValues objectAtIndex:[self.detailAgent.assessment unsignedIntegerValue]];
}

#pragma mark - Text field delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    BOOL shouldReturn = YES;
    if (textField == self.nameTextField) {
        [textField resignFirstResponder];
        shouldReturn = NO;
    }
    return shouldReturn;
}

@end
