//
//  GlobalConfig.h
//  Forum
//
//  Created by Lei Zhu on 12-8-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate.h"

#ifndef GLOBAL_CONFIG
#define GLOBAL_CONFIG

#if DEBUG
//#define NSLog(...) NSLog(__VA_ARGS__)
#define NSLog(s,...) NSLog(@"%s LINE:%d < %@ >",__FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define NSLog(...) {}
#endif

#define ENABLE_APP_DEBUG YES //开启后打开debug模式

#define USEING_NETWORK YES

#define IS_IOS_7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) ? YES : NO)

#define IS_4_INCH_SCREEN  ([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO

#define SCREEN_WIDTH (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? [[UIScreen mainScreen] bounds].size.width : 1024)

#define SCREEN_HEIGHT (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? ([[UIScreen mainScreen] bounds].size.height - 20) : ((IS_IOS_7 == YES) ? 768 : 768))

#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define DOCUMENT_DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define BUNDLE_IDENTIFIER [[NSBundle mainBundle] bundleIdentifier]

#define DB_PATH [DOCUMENT_DIRECTORY_PATH stringByAppendingPathComponent:@"JiuHaoDatabase.db"]

#define BUNDLE_FILE_PATH(filename)  [[NSBundle mainBundle] pathForAuxiliaryExecutable:filename]

#define COLOR_RGB(r,g,b) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1]

#define COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:a]

#define NAV_BAR_HEIGHT (IS_IOS_7 ? 64 : 44)

#define NUMBERS @"0123456789,\n"

#define DECIMAL_NUMBERS @"0123456789,.\n"

#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

#endif

