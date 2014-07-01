//
//  RootViewController.m
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "RootViewController.h"
#import "AdBoardView.h"
#import "SettingViewController.h"

@interface RootViewController ()


@property (nonatomic , strong) AdBoardView * adBoardView;
@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
       NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSData * udObject = [userDefaults objectForKey:@"AdBoardData"];
    AdBoardData * adBoardData = [[AdBoardData alloc] init];

    if (!udObject) {
        adBoardData.inputTxt = @"欢迎使用电子广告板.点击右下角设置按钮,开启您的个性广告板.";
        adBoardData.fontName = @"Thonburi-Bold";
        adBoardData.fontSize = 80;
        
        adBoardData.font_redValue = 1.0;
        adBoardData.font_greenValue = 1.0;
        adBoardData.font_blueValue = 1.0;
        
        adBoardData.bg_redValue = 0.0;
        adBoardData.bg_greenValue = 0.0;
        adBoardData.bg_blueValue = 0.0;
        adBoardData.moveSpeed = 1.0;
        NSData * udObject = [NSKeyedArchiver archivedDataWithRootObject:adBoardData];
        [userDefaults setObject:udObject forKey:@"AdBoardData"];
        [userDefaults synchronize];
    }
    
    udObject = [userDefaults objectForKey:@"AdBoardData"];
    adBoardData = [NSKeyedUnarchiver unarchiveObjectWithData:udObject];
    
    self.adBoardView = [[AdBoardView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.adBoardView.adBoardData = adBoardData;
    
    [self.adBoardView initContentView];
    [self.view addSubview:self.adBoardView];
    [self.view sendSubviewToBack:self.adBoardView];

    [self initClockView];
    [self initSettingBtn];    
}

- (void)initClockView
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 90, 5, 85, 20)];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    //    NSString * batteryLevel = [NSString stringWithFormat:@"%.2f",[[UIDevice currentDevice] batteryLevel]];
    label.text = [self getCurrentDateString];
    [self.view addSubview:label];
}

- (NSString *)getCurrentDateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"h:mm aa"];
    [dateFormatter setPMSymbol:@"下午"];
    [dateFormatter setAMSymbol:@"上午"];
    //    [dateFormatter setDateFormat:@"HH(24制):hh(12制):mm 'on' EEEE MMMM d"];
    NSString * date = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"date%@",date);
    return date;
}

- (void)initSettingBtn
{
    UIButton * settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, SCREEN_HEIGHT - 70, 60, 60)];
    [settingBtn addTarget:self action:@selector(settingBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"image_setting.png"] forState:UIControlStateNormal];
    [self.view addSubview:settingBtn];
}

- (void)settingBtnPressed:(UIButton *)sender
{
    SettingViewController * settingViewCtrller = [[SettingViewController alloc] init];
    
    [settingViewCtrller getSettingParameters:^(AdBoardData * adBoardData, SettingViewController *controller) {
        [self.adBoardView removeFromSuperview];
        self.adBoardView = nil;
        
        self.adBoardView = [[AdBoardView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT)];
        self.adBoardView.adBoardData = adBoardData;
        
        [self.adBoardView initContentView];
        [self.view addSubview:self.adBoardView];
        [self.view sendSubviewToBack:self.adBoardView];
        
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        NSData * udObject = [NSKeyedArchiver archivedDataWithRootObject:adBoardData];
        [userDefaults setObject:udObject forKey:@"AdBoardData"];
        [userDefaults synchronize];
        
    }];
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:settingViewCtrller];
    nav.modalPresentationStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
