//
//  AdBoardData.m
//  AdBoards
//
//  Created by Sidney on 14-7-1.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "AdBoardData.h"

@implementation AdBoardData


- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        self.inputTxt = [coder decodeObjectForKey:@"inputTxt"];
        self.fontName = [coder decodeObjectForKey:@"fontName"];
        self.fontSize = [coder decodeFloatForKey:@"fontSize"];
        self.font_redValue = [coder decodeFloatForKey:@"font_redValue"];
        self.font_greenValue = [coder decodeFloatForKey:@"font_greenValue"];
        self.font_blueValue = [coder decodeFloatForKey:@"font_blueValue"];
        self.bg_redValue = [coder decodeFloatForKey:@"bg_redValue"];
        self.bg_greenValue = [coder decodeFloatForKey:@"bg_greenValue"];
        self.bg_blueValue = [coder decodeFloatForKey:@"bg_blueValue"];
        self.displayType = [coder decodeIntegerForKey:@"displayType"];
        self.moveSpeed = [coder decodeFloatForKey:@"moveSpeed"];
    }
    return self;
}


- (void)encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.inputTxt forKey:@"inputTxt"];
    [coder encodeObject:self.fontName forKey:@"fontName"];
    [coder encodeFloat:self.fontSize forKey:@"fontSize"];

    [coder encodeFloat:self.font_redValue forKey:@"font_redValue"];
    [coder encodeFloat:self.font_greenValue forKey:@"font_greenValue"];
    [coder encodeFloat:self.font_blueValue forKey:@"font_blueValue"];
    [coder encodeFloat:self.bg_redValue forKey:@"bg_redValue"];
    [coder encodeFloat:self.bg_greenValue forKey:@"bg_greenValue"];
    [coder encodeFloat:self.bg_blueValue forKey:@"bg_blueValue"];
    
    [coder encodeInt:self.displayType forKey:@"displayType"];
    [coder encodeFloat:self.moveSpeed forKey:@"moveSpeed"];

}
@end
