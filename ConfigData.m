//
//  ConfigData.m
//  GreatWall
//
//  Created by Sidney on 13-3-20.
//  Copyright (c) 2013年 BH Technology Co., Ltd. All rights reserved.
//

#import "ConfigData.h"


static ConfigData * _instance;
static dispatch_once_t once;


@implementation ConfigData

+ (instancetype)shareInstance
{
    dispatch_once(&once, ^{
        _instance = [[ConfigData alloc] init];
    });
    return _instance;    
}

@end
