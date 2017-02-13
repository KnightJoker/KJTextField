//
//  ViewController.m
//  KJTextField
//
//  Created by Huni on 17/2/13.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "ViewController.h"
#import "ShockTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setupView

- (void)setupView {

    ShockTextField *textField = [[ShockTextField alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    textField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textField];
    
    
    
    ShockTextField *textField_0 = [[ShockTextField alloc] initWithFrame:CGRectMake(100, 400, 200, 30)];
    textField_0.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textField_0];
    
}

@end
