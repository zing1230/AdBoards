//
//  ColorSettingViewController.h
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorSettingViewController : UIViewController


@property (nonatomic , assign) float font_redValue;
@property (nonatomic , assign) float font_greenValue;
@property (nonatomic , assign) float font_blueValue;

@property (nonatomic , assign) float bg_redValue;
@property (nonatomic , assign) float bg_greenValue;
@property (nonatomic , assign) float bg_blueValue;


@property (nonatomic , strong) NSString * txt;
@property (nonatomic , strong) NSString * fontName;
@property (nonatomic , strong) void( ^colorSetting)(float fontRedValue , float fontGreenValue ,float fontBlueValue , float bgRedValue ,float bgGreenValue ,float bgBlueValue ,ColorSettingViewController * controller);

- (void)getColorSetting:(void(^)(float fontRedValue , float fontGreenValue ,float fontBlueValue , float bgRedValue ,float bgGreenValue ,float bgBlueValue ,ColorSettingViewController * controller)) block;



@end
