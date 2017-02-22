//
//  MagicImageTextField.m
//  KJTextField
//
//  Created by 来自遥远星系的核心巡洋舰 on 17/2/17.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import "MagicImageTextField.h"

@interface MagicImageTextField () <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UILabel *placeHolderLabel;
@property (strong, nonatomic) UIImageView *placeHolderImageView;

@property (strong, nonatomic) UITapGestureRecognizer *gestureRec;

@end

@implementation MagicImageTextField

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
    
    _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds))];
    _placeHolderLabel.font = [UIFont systemFontOfSize:14];
    _placeHolderLabel.textColor = [UIColor lightGrayColor];
    _placeHolderLabel.text = placeholder;
    [self addSubview:_placeHolderLabel];
    
    _placeHolderLabel.userInteractionEnabled = YES;
    _gestureRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(placeHolderLabelDidClick:)];
    [_placeHolderLabel addGestureRecognizer:_gestureRec];
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    
    _placeHolderLabel.textColor = placeHolderColor;
}

- (void)setPlaceHolderFont:(UIFont *)placeHolderFont {
    
    _placeHolderLabel.font = placeHolderFont;
}

- (void)setPlaceHolderImage:(UIImage *)placeHolderImage {

    _placeHolderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-CGRectGetWidth(self.bounds) / 5, 0, CGRectGetWidth(self.bounds) / 5,CGRectGetHeight(self.bounds))];
    _placeHolderImageView.image = placeHolderImage;
    _placeHolderImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:_placeHolderImageView];
    
    _placeHolderImageView.hidden = YES;
}

#pragma mark - setupView

- (void)setupView {

    self.userInteractionEnabled = YES;
 
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) / 5 + 4, 0, CGRectGetWidth(self.bounds) * 4 / 5, CGRectGetHeight(self.bounds))];
    [self addSubview:_textField];
    [_textField addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEnd];

}

#pragma mark - events

- (void)placeHolderLabelDidClick:(id)sender {
    
    _placeHolderImageView.hidden = NO;
    [_textField becomeFirstResponder];
    [self runDidBeginAnimation];
}

#pragma mark - textField delegate

- (void)textFieldDidEndEditing:(UITextField *)textField {

    if ([_textField.text isEqualToString:@""]) {
        
        _placeHolderLabel.hidden = NO;
        [self runDidEndAnimation];
    }
}

#pragma mark - animation

- (void)runDidBeginAnimation {

    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^(){
                         _placeHolderLabel.frame = CGRectMake(CGRectGetWidth(self.bounds) / 5, 0, CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds));
                     
                     } completion:^(BOOL finish){
                         _placeHolderLabel.hidden = YES;
                     }];
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^(){
                         _placeHolderImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds) / 5,CGRectGetHeight(self.bounds));
                         
                     } completion:nil];
    
}


- (void)runDidEndAnimation {
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^(){
                         _placeHolderLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds));
                         
                     } completion:nil];
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^(){
                         _placeHolderImageView.frame = CGRectMake(-CGRectGetWidth(self.bounds) / 5, 0, CGRectGetWidth(self.bounds) / 5,CGRectGetHeight(self.bounds));
                         
                     } completion:^(BOOL finish){
                         _placeHolderImageView.hidden = YES;
                     }];

    
}

@end
