//
//  FontSettingViewController.h
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontSettingViewController : UIViewController


@property (nonatomic , strong) NSString * txt;
@property (nonatomic , strong) NSString * currentFontName;
@property (nonatomic , assign) float fontSize;

@property (nonatomic ,strong) void(^fontSetting)(NSString * fontName , float fontSize ,FontSettingViewController *controller);

- (void)getFontSetting:(void (^)(NSString * fontName , float fontSize ,FontSettingViewController *controller)) block;


@end
