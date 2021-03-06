//
//  MoveLineTextField.m
//  KJTextField
//
//  Created by Huni on 17/2/14.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "MoveLineTextField.h"

@interface MoveLineTextField ()

@property (strong, nonatomic) UILabel *placeHolderLabel;
@property (strong, nonatomic) UIView *bottomLineView;

@end

@implementation MoveLineTextField

#pragma mark - init

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        
        [self setupView];
    }
    return self;
}

#pragma mark - setter / getter

- (void)setPlaceholder:(NSString *)placeholder {

    _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.bounds.size.width, self.bounds.size.height)];
    _placeHolderLabel.font = [UIFont systemFontOfSize:14];
    _placeHolderLabel.textColor = [UIColor lightGrayColor];
    _placeHolderLabel.text = placeholder;
    [self addSubview:_placeHolderLabel];
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {

    _placeHolderLabel.textColor = placeHolderColor;
}

- (void)setPlaceHolderFont:(UIFont *)placeHolderFont {

    _placeHolderLabel.font = placeHolderFont;
}

- (void)setLineColor:(UIColor *)lineColor {

    _bottomLineView.backgroundColor = lineColor;
}


#pragma mark - UI

- (void)setupView {

    _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds), 0, 2)];
    _bottomLineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_bottomLineView];
    
    [self addTarget:self action:@selector(textFieldEdittingDidBeginInternal:) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textFieldEdittingDidEndInternal:) forControlEvents:UIControlEventEditingDidEnd];
}

#pragma mark - textField events

- (void)textFieldEdittingDidBeginInternal:(UITextField *)sender {
    
    [self runDidBeginAnimation];
}


- (void)textFieldEdittingDidEndInternal:(UITextField *)sender {

    if ([self.text isEqualToString:@""]) {
        [self runDidEndAnimation];
    }
  
}
#pragma mark - animation

- (void)runDidBeginAnimation {
    
    
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear animations:^(){
                        
                            _bottomLineView.frame = CGRectMake(0, CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds), 2);
                            
                            _placeHolderLabel.frame = CGRectMake(0, -CGRectGetHeight(self.bounds), CGRectGetWidth(_placeHolderLabel.bounds), CGRectGetHeight(_placeHolderLabel.bounds));
                            }
                     completion:nil];
    
}

- (void)runDidEndAnimation {
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear animations:^(){
                            
                            _bottomLineView.frame = CGRectMake(0, CGRectGetHeight(self.bounds), 0, 2);
                            
                            _placeHolderLabel.frame = CGRectMake(5, 0, self.bounds.size.width, self.bounds.size.height);
                        }
                     completion:nil];
    
}


@end
