//
//  NSDate+category.m
//  NovartisPPH
//
//  Created by Sidney on 13-10-16.
//  Copyright (c) 2013年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "NSDate+category.h"

@implementation NSDate (category)

+ (NSDate *)stringToDate:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * date = [dateFormatter dateFromString:dateString];
    return date;
}

@end
