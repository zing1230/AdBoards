//
//  SettingViewController.m
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "SettingViewController.h"
#import "InputBoxViewController.h"
#import "FontSettingViewController.h"
#import "ColorSettingViewController.h"
#import "SpeedSettingViewController.h"
#import "DispalyTypeViewController.h"

@interface SettingViewController ()
<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic , strong) AdBoardData * adBoardData;
@property (nonatomic , strong) UITableView * tableView;

@end

@implementation SettingViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(closeBtnPressed:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleBordered target:self action:@selector(publishBtnPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 540, 620) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSData * udObject = [userDefaults objectForKey:@"AdBoardData"];
    self.adBoardData = (AdBoardData *)[NSKeyedUnarchiver unarchiveObjectWithData:udObject];
    
}

- (void)closeBtnPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)publishBtnPressed:(id)sender
{
    self.settingParameters(self.adBoardData,self);
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)getSettingParameters:(void(^)(AdBoardData * adBoardData,SettingViewController * controller))block
{
    self.settingParameters = [block copy];
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    //    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSString * txt;
    int row = indexPath.row;
    switch (row) {
        case 0:
        {
            txt = @"文字内容";
            cell.detailTextLabel.textColor = [UIColor lightGrayColor];
            cell.detailTextLabel.text = self.adBoardData.inputTxt;
        }
            break;
        case 1:
        {
            txt = @"字体设置";
        }
            break;
        case 2:
        {
            txt = @"颜色设置";
            //            cell.textLabel.textColor = [UIColor colorWithRed:self.font_redValue green:self.font_greenValue blue:self.font_blueValue alpha:1.0];
            //
            //            cell.textLabel.backgroundColor = [UIColor colorWithRed:self.bg_redValue green:self.bg_greenValue blue:self.bg_blueValue alpha:1.0];
        }
            break;
        case 3:
        {
            txt = @"显示样式设置";
        }
            break;
        case 4:
        {
            txt = @"移动速度设置";
        }
            break;
            
        default:
            break;
    }
    
    cell.textLabel.text = txt;
    
    return cell;
}

#pragma mark TableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (row) {
        case 0:
        {
            InputBoxViewController * inputBoxViewCtrller = [[InputBoxViewController alloc] init];
            inputBoxViewCtrller.txt = self.adBoardData.inputTxt;
            
            [self.navigationController pushViewController:inputBoxViewCtrller animated:YES];
            
            [inputBoxViewCtrller getInputBoxContext:^(NSString *context, InputBoxViewController *controller) {
                NSLog(@"context:%@",context);
                self.adBoardData.inputTxt = context;
                [self.tableView reloadData];
            }];
            
        }
            break;
        case 1:
        {
            FontSettingViewController * fontSettingViewCtrller = [[FontSettingViewController alloc] init];
            fontSettingViewCtrller.txt = self.adBoardData.inputTxt;
            
            fontSettingViewCtrller.fontSize = self.adBoardData.fontSize;
            fontSettingViewCtrller.currentFontName = self.adBoardData.fontName;
            [self.navigationController pushViewController:fontSettingViewCtrller animated:YES];
            
            [fontSettingViewCtrller getFontSetting:^(NSString *fontName, float fontSize, FontSettingViewController *controller) {
                self.adBoardData.fontName = fontName;
                self.adBoardData.fontSize = fontSize;
                
            }];
            
        }
            break;
        case 2:
        {
            ColorSettingViewController * colorSettingViewCtrller = [[ColorSettingViewController alloc] init];
            colorSettingViewCtrller.txt = self.adBoardData.inputTxt;
            colorSettingViewCtrller.fontName = self.adBoardData.fontName;
            
            colorSettingViewCtrller.font_redValue = self.adBoardData.font_redValue;
            colorSettingViewCtrller.font_greenValue = self.adBoardData.font_greenValue;
            colorSettingViewCtrller.font_blueValue = self.adBoardData.font_blueValue;
            
            colorSettingViewCtrller.bg_redValue = self.adBoardData.bg_redValue;
            colorSettingViewCtrller.bg_greenValue = self.adBoardData.bg_greenValue;
            colorSettingViewCtrller.bg_blueValue = self.adBoardData.bg_blueValue;
            
            
            [self.navigationController pushViewController:colorSettingViewCtrller animated:YES];
            
            [colorSettingViewCtrller getColorSetting:^(float fontRedValue, float fontGreenValue, float fontBlueValue, float bgRedValue, float bgGreenValue, float bgBlueValue, ColorSettingViewController *controller) {
                
                self.adBoardData.font_redValue = fontRedValue;
                self.adBoardData.font_greenValue = fontGreenValue;
                self.adBoardData.font_blueValue = fontBlueValue;
                
                self.adBoardData.bg_redValue = bgRedValue;
                self.adBoardData.bg_greenValue = bgGreenValue;
                self.adBoardData.bg_blueValue = bgBlueValue;
                [self.tableView reloadData];
            }];
        }
            break;
        case 3:
        {
            DispalyTypeViewController * dispalyTypeViewCtrller = [[DispalyTypeViewController alloc] init];
            dispalyTypeViewCtrller.displayType = self.adBoardData.displayType;
            
            [self.navigationController pushViewController:dispalyTypeViewCtrller animated:YES];
            [dispalyTypeViewCtrller getDisplayTypeSetting:^(DISPLAY_TYPE displayType, DispalyTypeViewController *controller) {
                self.adBoardData.displayType = displayType;
            }];

        }
            break;
        case 4:
        {
            SpeedSettingViewController * speedSettingViewCtrller = [[SpeedSettingViewController alloc] init];
            [self.navigationController pushViewController:speedSettingViewCtrller animated:YES];
        }
            break;
        default:
            break;
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
