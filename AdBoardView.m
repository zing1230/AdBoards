//
//  AdBoardView.m
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "AdBoardView.h"
#import "FTAnimation.h"

@interface AdBoardView()


@property (nonatomic , strong) UILabel * txtLabel;
@property (nonatomic , strong) UIScrollView * scrollView;
@property (nonatomic , strong) NSTimer * timer;
@end

@implementation AdBoardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];

    }
    return self;
}

- (void)initContentView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT)];
    self.scrollView.backgroundColor = [UIColor colorWithRed:self.adBoardData.bg_redValue  green:self.adBoardData.bg_greenValue  blue:self.adBoardData.bg_blueValue alpha:1];//[UIColor clearColor];
    [self addSubview:self.scrollView];
    
    self.txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.txtLabel.text = self.adBoardData.inputTxt;
    
    self.txtLabel.backgroundColor = [UIColor colorWithRed:self.adBoardData.bg_redValue  green:self.adBoardData.bg_greenValue  blue:self.adBoardData.bg_blueValue alpha:1];
    
    self.txtLabel.textColor =  [UIColor colorWithRed:self.adBoardData.font_redValue green:self.adBoardData.font_greenValue  blue:self.adBoardData.font_blueValue alpha:1];
    
    self.txtLabel.font = [UIFont fontWithName:self.adBoardData.fontName size:self.adBoardData.fontSize];
    self.txtLabel.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:self.txtLabel];
    
    CGSize size = [self.adBoardData.inputTxt sizeWithFont:[UIFont fontWithName:self.adBoardData.fontName size:self.adBoardData.fontSize]constrainedToSize:CGSizeMake(MAXFLOAT, SCREEN_HEIGHT)];
    
    CGRect frame = self.txtLabel.frame;
    frame.size.width = size.width;
    self.txtLabel.frame = frame;
//    self.scrollView.contentSize = CGSizeMake(size.width, SCREEN_HEIGHT);
    NSLog(@"size.width:%.0f",size.width);

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02f target:self selector:@selector(moving) userInfo:nil repeats:YES];
}

- (void)moving
{
    [UIView animateWithDuration:1.0f animations:^{
        CGRect frame = self.txtLabel.frame;
        frame.origin.x -= 2;
//        NSLog(@"frame.origin.x:%.0f",frame.origin.x);
        self.txtLabel.frame = frame;
    }];
    
    CGRect frame = self.txtLabel.frame;
    if (abs(frame.origin.x) >= self.txtLabel.frame.size.width) {
        frame.origin.x = 1024;
        self.txtLabel.frame = frame;
    }
}

- (void)removeFromSuperview
{
    [super removeFromSuperview];
    [self.timer invalidate];
    self.timer = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
