//
//  AdBoardData.h
//  AdBoards
//
//  Created by Sidney on 14-7-1.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdBoardData : NSObject


@property (nonatomic , strong) NSString * inputTxt;//显示文字
@property (nonatomic , strong) NSString * fontName;//字体
@property (nonatomic , assign) float fontSize;//字体大小

@property (nonatomic , assign) float font_redValue;//字体 R
@property (nonatomic , assign) float font_greenValue;//字体 G
@property (nonatomic , assign) float font_blueValue;//字体 B

@property (nonatomic , assign) float bg_redValue;//背景色 R
@property (nonatomic , assign) float bg_greenValue;//背景色 G
@property (nonatomic , assign) float bg_blueValue;//背景色 B

@property (nonatomic , assign) float moveSpeed;//移动速度



@end
