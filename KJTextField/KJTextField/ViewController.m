//
//  ViewController.m
//  KJTextField
//
//  Created by Huni on 17/2/13.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "ViewController.h"
#import "MoveTextField.h"

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

    MoveTextField *textField = [[MoveTextField alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    textField.placeholder = @"Name";
//    textField.backgroundColor = [UIColor yellowColor];
//    textField.lineColor = [UIColor greenColor];
    [self.view addSubview:textField];
    
    UITextField *textField_0 = [[UITextField alloc] initWithFrame:CGRectMake(100, 500, 200, 30)];
    textField_0.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textField_0];
    
    
//    StandTextField *textField_0 = [[StandTextField alloc] initWithFrame:CGRectMake(100, 400, 200, 30)];
//    textField_0.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:textField_0];
    
}

@end
