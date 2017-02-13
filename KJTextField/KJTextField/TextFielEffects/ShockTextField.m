//
//  ShockTextField.m
//  KJTextField
//
//  Created by Huni on 17/2/13.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "ShockTextField.h"

@implementation ShockTextField


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
//    
//    [UIView animateWithDuration:0.1
//                          delay:0.0
//                        options:UIViewAnimationOptionShowHideTransitionViews | UIViewAnimationOptionCurveEaseIn
//                     animations:^(){
//                         self.layer.borderWidth = 10.0f;
//                     } completion:^(BOOL finished){
//                     
//                         self.layer.borderWidth = 0.0f;
//                     }];
}

- (void)runDidEndAnimation {
    
    
}

@end
