//
//  ViewController.m
//  KJTextField
//
//  Created by Huni on 17/2/13.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "ViewController.h"
#import "ShockTextField.h"
#import "MagicImageTextField.h"

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
    textField.placeholder = @"Name";
//    textField.userInteractionEnabled = NO;
//    textField.backgroundColor = [UIColor yellowColor];
//    textField.lineColor = [UIColor greenColor];
//    textField.placeHolderColor = [UIColor yellowColor];
    textField.borderColor = [UIColor yellowColor];
    [self.view addSubview:textField];
    
    MagicImageTextField *textField_0 = [[MagicImageTextField alloc] initWithFrame:CGRectMake(100, 500, 200, 30)];
//    textField_0.backgroundColor = [UIColor greenColor];
    textField_0.placeholder = @"Time";
    
    UIImage *image = [[UIImage alloc] init];
    image = [UIImage imageNamed:@"ic_finish_ waiting"];
    
    textField_0.placeHolderImage = image;
    [self.view addSubview:textField_0];
    
    
    
//    StandTextField *textField_0 = [[StandTextField alloc] initWithFrame:CGRectMake(100, 400, 200, 30)];
//    textField_0.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:textField_0];
    
}

@end
