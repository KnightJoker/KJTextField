//
//  MagicImageTextField.h
//  KJTextField
//
//  Created by 来自遥远星系的核心巡洋舰 on 17/2/17.
//  Copyright © 2017年 KnightJoker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagicImageTextField : UITextField

@property (nullable, nonatomic, strong) UIImage *placeHolderImage;
@property (nullable, nonatomic, copy) UIColor *placeHolderColor;      // default is lightGray
@property (nullable, nonatomic, copy) UIFont *placeHolderFont;       //default is font14

@end
