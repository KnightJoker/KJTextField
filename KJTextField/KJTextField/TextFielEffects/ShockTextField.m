//
//  ShockTextField.m
//  KJTextField
//
//  Created by Huni on 17/2/13.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "ShockTextField.h"

@implementation ShockTextField

#pragma mark - init

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        
        [self updateUI];
    }
    return self;
}

#pragma mark - updateUI

- (void)updateUI {
    
    [self addTarget:self action:@selector(textFieldEdittingDidBeginInternal:) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textFieldEdittingDidEndInternal:) forControlEvents:UIControlEventEditingDidEnd];
    
}

#pragma mark - textField events

- (void)textFieldEdittingDidBeginInternal:(UITextField *)sender {
    
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.borderWidth = 2.0f;
    [self runDidBeginAnimation];
}


- (void)textFieldEdittingDidEndInternal:(UITextField *)sender {

    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth = 0.0f;
    [self runDidEndAnimation];
}
#pragma mark - animation

- (void)runDidBeginAnimation {
    
    
    // Todo HUNI animation's work

}

- (void)runDidEndAnimation {
    
    
}

@end
