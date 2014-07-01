//
//  InputBoxViewController.h
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface InputBoxViewController : UIViewController

@property (nonatomic , strong) NSString * txt;
@property (nonatomic ,strong) void(^inputBoxContext)(NSString * context , InputBoxViewController *controller);

- (void)getInputBoxContext:(void (^)(NSString * context , InputBoxViewController *controller)) block;

@end
