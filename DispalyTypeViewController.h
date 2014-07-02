//
//  DispalyTypeViewController.h
//  AdBoards
//
//  Created by Sidney on 14-7-1.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdBoardData.h"

@interface DispalyTypeViewController : UIViewController

@property (nonatomic , assign) DISPLAY_TYPE displayType;//展示类型

@property (nonatomic , strong) void(^ displayTypeSetting)(DISPLAY_TYPE displayType,DispalyTypeViewController * controller);

- (void)getDisplayTypeSetting:(void(^)(DISPLAY_TYPE displayType,DispalyTypeViewController * controller))block;


@end
