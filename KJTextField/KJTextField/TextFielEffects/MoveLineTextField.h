//
//  MoveLineTextField.h
//  KJTextField
//
//  Created by Huni on 17/2/14.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoveLineTextField : UITextField

@property (nullable, nonatomic, copy) UIColor *placeHolderColor;      // default is lightGray
@property (nullable, nonatomic, copy) UIColor *lineColor;
@property (nullable, nonatomic, copy) UIFont *placeHolderFont;       //default is font14

@end
