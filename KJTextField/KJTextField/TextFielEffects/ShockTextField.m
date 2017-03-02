//
//  ShockTextField.m
//  KJTextField
//
//  Created by Huni on 17/2/13.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "ShockTextField.h"


static const NSInteger animationTime = 0.3;

@interface ShockTextField ()

@property (strong, nonatomic) UIView *leftLineView;
@property (strong, nonatomic) UIView *bottomLineView;
@property (strong, nonatomic) UIView *rightLineView;
@property (strong, nonatomic) UIView *topLineView;

@end

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
    
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.borderWidth = 1.0f;
    
    _topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 1)];
    _topLineView.backgroundColor = _borderColor;
    
    _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - 1, CGRectGetWidth(self.bounds), 1)];
    _bottomLineView.backgroundColor = _borderColor;
    
    _leftLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, CGRectGetHeight(self.bounds))];
    _leftLineView.backgroundColor = _borderColor;
    
    _rightLineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) - 1,0, 1, CGRectGetHeight(self.bounds))];
    _rightLineView.backgroundColor = _borderColor;
    
    [self addSubview:_topLineView];
    [self addSubview:_bottomLineView];
    [self addSubview:_leftLineView];
    [self addSubview:_rightLineView];
    
    [self runDidBeginAnimation];
}


- (void)textFieldEdittingDidEndInternal:(UITextField *)sender {

    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth = 0.0f;
    [_topLineView removeFromSuperview];
    [_bottomLineView removeFromSuperview];
    [_leftLineView removeFromSuperview];
    [_rightLineView removeFromSuperview];
    [self runDidEndAnimation];
}
#pragma mark - animation

- (void)runDidBeginAnimation {
    
    
    CABasicAnimation *animationYTop = [CABasicAnimation animation];
    animationYTop.keyPath = @"position.y";
    animationYTop.fromValue = @0;
    animationYTop.toValue = @-10;
    
    CABasicAnimation *animationWidthTop = [CABasicAnimation animation];
    animationWidthTop.keyPath = @"bounds.size.width";
    animationWidthTop.fromValue = @(CGRectGetWidth(self.bounds));
    animationWidthTop.toValue = @(CGRectGetWidth(self.bounds) + 10);
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = [NSArray arrayWithObjects:animationYTop, animationWidthTop, nil];
    animationGroup.duration = animationTime;
    
    [_topLineView.layer addAnimation:animationGroup forKey:@"basic_top"];
    
    CABasicAnimation *animationYBottom = [CABasicAnimation animation];
    animationYBottom.keyPath = @"position.y";
    animationYBottom.fromValue = @(CGRectGetHeight(self.bounds));
    animationYBottom.toValue = @(CGRectGetHeight(self.bounds) + 10);
    
    CAAnimationGroup *animationGroup1 = [CAAnimationGroup animation];
    animationGroup1.animations = [NSArray arrayWithObjects:animationYBottom, animationWidthTop, nil];
    animationGroup1.duration = animationTime;
    
    [_bottomLineView.layer addAnimation:animationGroup1 forKey:@"basic_bottom"];
    
    CABasicAnimation *animationXLeft = [CABasicAnimation animation];
    animationXLeft.keyPath = @"position.x";
    animationXLeft.fromValue = @0;
    animationXLeft.toValue = @-8;
    
    CABasicAnimation *animationXHeight = [CABasicAnimation animation];
    animationXHeight.keyPath = @"bounds.size.height";
    animationXHeight.fromValue = @(CGRectGetHeight(self.bounds));
    animationXHeight.toValue = @(CGRectGetHeight(self.bounds) + 16);
    
    CAAnimationGroup *animationGroup2 = [CAAnimationGroup animation];
    animationGroup2.animations = [NSArray arrayWithObjects:animationXLeft,animationXHeight, nil];
    animationGroup2.duration = animationTime;
    
    [_leftLineView.layer addAnimation:animationGroup2 forKey:@"basic_left"];
    
    CABasicAnimation *animationXRight = [CABasicAnimation animation];
    animationXRight.keyPath = @"position.x";
    animationXRight.fromValue = @(CGRectGetWidth(self.bounds));
    animationXRight.toValue = @(CGRectGetWidth(self.bounds) + 8);
    
    CAAnimationGroup *animationGroup3 = [CAAnimationGroup animation];
    animationGroup3.animations = [NSArray arrayWithObjects:animationXRight,animationXHeight, nil];
    animationGroup3.duration = animationTime;
    
    [_rightLineView.layer addAnimation:animationGroup3 forKey:@"basic_right"];
    
}

- (void)runDidEndAnimation {
    
    
}

@end
