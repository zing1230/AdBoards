//
//  DispalyTypeViewController.m
//  AdBoards
//
//  Created by Sidney on 14-7-1.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "DispalyTypeViewController.h"

@interface DispalyTypeViewController ()

@property(nonatomic , strong) UILabel * curSelectedLabel;
@property(nonatomic , strong) UIButton * horizontalBtn;
@property(nonatomic , strong) UIButton * verticalBtn;

@end

@implementation DispalyTypeViewController

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
    self.title = @"显示样式设置";
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(saveBtnPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.curSelectedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 540, 80)];
    self.curSelectedLabel.textAlignment = NSTextAlignmentCenter;
    self.curSelectedLabel.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:self.curSelectedLabel];
    
    self.horizontalBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 340, 80)];
    [self.horizontalBtn setTitle:@"横向循环展示..." forState:UIControlStateNormal];
    [self.horizontalBtn setBackgroundColor:[UIColor blackColor]];
    self.horizontalBtn.tag = 0;
    [self.horizontalBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.horizontalBtn];
    
    self.verticalBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 250, 80, 200)];
    self.verticalBtn.titleLabel.numberOfLines = 4;
    [self.verticalBtn setTitle:@"竖向循环展示..." forState:UIControlStateNormal];
    [self.verticalBtn setBackgroundColor:[UIColor blackColor]];
    self.verticalBtn.tag = 1;
    [self.verticalBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.verticalBtn];
    
    if (self.displayType == DISPLAY_TYPE_HORIZONTAL){
        [self.horizontalBtn setBackgroundColor:[UIColor redColor]];
        self.curSelectedLabel.text = @"当前展示类型是:横向循环展示";
    }else if(self.displayType == DISPLAY_TYPE_VERTICAL){
        [self.verticalBtn setBackgroundColor:[UIColor redColor]];
        self.curSelectedLabel.text = @"当前展示类型是:竖向循环展示";
    }
}

- (void)getDisplayTypeSetting:(void(^)(DISPLAY_TYPE displayType,DispalyTypeViewController * controller))block
{
    self.displayTypeSetting = [block copy];
}

- (void)btnPressed:(UIButton *)sender
{
    if (sender.tag == 0) {
        [self.horizontalBtn setBackgroundColor:[UIColor redColor]];
        [self.verticalBtn setBackgroundColor:[UIColor blackColor]];
        self.curSelectedLabel.text = @"当前展示类型是:横向循环展示";
        self.displayType = DISPLAY_TYPE_HORIZONTAL;
    }else if(sender.tag == 1){
        [self.horizontalBtn setBackgroundColor:[UIColor blackColor]];
        [self.verticalBtn setBackgroundColor:[UIColor redColor]];
        self.curSelectedLabel.text = @"当前展示类型是:竖向循环展示";
        self.displayType = DISPLAY_TYPE_VERTICAL;
    }
}

- (void)saveBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    self.displayTypeSetting(self.displayType,self);
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
