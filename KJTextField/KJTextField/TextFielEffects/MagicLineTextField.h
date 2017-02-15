//
//  MagicLineTextField.h
//  KJTextField
//
//  Created by 来自遥远星系的核心巡洋舰 on 17/2/15.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagicLineTextField : UITextField

@property (nullable, nonatomic, copy) UIColor *placeHolderColor;      // default is lightGray
@property (nullable, nonatomic, copy) UIColor *lineColor;             // default is lightGray,and this color is also the editing backgroundColor
@property (nullable, nonatomic, copy) UIFont *placeHolderFont;       //default is font14


@end
