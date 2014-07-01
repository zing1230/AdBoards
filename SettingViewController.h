//
//  SettingViewController.h
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdBoardData.h"

@interface SettingViewController : UIViewController


@property (nonatomic , strong) void( ^settingParameters)(AdBoardData * adBoardData,SettingViewController * controller);

- (void)getSettingParameters:(void(^)(AdBoardData * adBoardData,SettingViewController * controller))block;

@end
