//
//  StandTextField.m
//  KJTextField
//
//  Created by Huni on 17/2/14.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "StandTextField.h"

@interface StandTextField ()

@property (strong, nonatomic) UIView *bottomLineView;

@end


@implementation StandTextField

#pragma mark - init

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        
        [self setupLineView];
        [self updateUI];
    }
    return self;
}

- (void)setupLineView {

    _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bounds), CGRectGetWidth(self.bounds), 2)];
    _bottomLineView.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:_bottomLineView];
}

#pragma mark - updateUI

- (void)updateUI {
    
    [self addTarget:self action:@selector(textFieldEdittingDidBeginInternal:) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textFieldEdittingDidEndInternal:) forControlEvents:UIControlEventEditingDidEnd];
    
}

#pragma mark - textField events

- (void)textFieldEdittingDidBeginInternal:(UITextField *)sender {
    
    [self runDidBeginAnimation];
}


- (void)textFieldEdittingDidEndInternal:(UITextField *)sender {
    
    [self runDidEndAnimation];
}
#pragma mark - animation

- (void)runDidBeginAnimation {
    
    // Todo HUNI animation's work

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"bounds.size.height";
    animation.fromValue = @2;
    animation.toValue = @(self.bounds.size.height);
//    animation.duration = 1;

    
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    

    CABasicAnimation *position = [CABasicAnimation animation];
    position.keyPath = @"position.y";
    position.fromValue = @(_bottomLineView.bounds.origin.y);
    position.toValue = @(self.bounds.origin.y + self.bounds.size.height / 2);

    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[ animation, position ];
    group.duration = 1.0;
    
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    [_bottomLineView.layer addAnimation:group forKey:@"basic"];
    
}

- (void)runDidEndAnimation {
    
    
}


@end
