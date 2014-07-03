//
//  FontSettingViewController.m
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "FontSettingViewController.h"

@interface FontSettingViewController ()
<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView * tableView;
@property (nonatomic , strong) NSArray * familyNamesArr;

@property (nonatomic , strong) UIScrollView * fontSizeView;
@property (nonatomic , strong) UISlider * slider;
@property (nonatomic , strong) UILabel * txtLabel;



@end

@implementation FontSettingViewController

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
    self.title = @"字体设置";

    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(saveBtnPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;

    UISegmentedControl * segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"字体",@"字号"]];
    segmentedControl.frame = CGRectMake(150, 60, 240, 30);
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self action:@selector(segmentedControlSelected:) forControlEvents:UIControlEventValueChanged];
    //    segmentedControl.tintColor = [UIColor redColor];
    [self.view addSubview:segmentedControl];
    
    self.familyNamesArr = [UIFont familyNames];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 540, 620 - 100) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
}

- (void)saveBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    if (self.slider.value == 0) {
        self.fontSetting(self.currentFontName,self.fontSize,self);
    }else{
        self.fontSetting(self.currentFontName,self.slider.value,self);
    }
}


- (void)getFontSetting:(void (^)(NSString * fontName , float fontSize ,FontSettingViewController *controller)) block
{
    self.fontSetting = [block copy];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

}

- (void)segmentedControlSelected:(UISegmentedControl *)control
{
    int index = control.selectedSegmentIndex;
    switch (index) {
        case 0:
        {
            [self.view addSubview:self.tableView];
            [self.slider removeFromSuperview];
            [self.fontSizeView removeFromSuperview];
        }
            break;
        case 1:
        {
            if (!self.fontSizeView) {
                
                self.fontSizeView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 540, 470)];
                self.fontSizeView.backgroundColor = [UIColor whiteColor];
                
                self.slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 100, 440, 30)];
                self.slider.minimumValue = 80;
                self.slider.maximumValue = 250;
                self.slider.value = self.fontSize;
                [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                [self.view addSubview:self.slider];
                
                self.txtLabel = [[UILabel alloc] initWithFrame:self.fontSizeView.bounds];
                self.txtLabel.backgroundColor = [UIColor orangeColor];
                self.txtLabel.textAlignment = NSTextAlignmentCenter;
                self.txt = [self.txt stringByReplacingOccurrencesOfString:@"\n" withString:@""];

                [self.fontSizeView addSubview:self.txtLabel];
                self.txtLabel.text = self.txt;
            }
            
            UIFont * font = [UIFont fontWithName:self.currentFontName size:self.fontSize];
            self.txtLabel.font = font;
            CGSize size = [self.txt sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 470)];
            CGRect frame = self.txtLabel.frame;
            frame.size.width = (size.width >= 540) ? size.width : 540;
            frame.size.height = (size.height >= 470) ? size.height : 470;
            
            self.txtLabel.frame = frame;
            self.fontSizeView.contentSize = CGSizeMake(size.width,size.height);

            
            self.txtLabel.font = [UIFont fontWithName:self.currentFontName size:self.fontSize];
            
            [self.view addSubview:self.fontSizeView];
            [self.view addSubview:self.slider];
            [self.tableView removeFromSuperview];
        }
            break;
        default:
            break;
    }
}

- (void)sliderValueChanged:(UISlider *)sender
{
    int value = sender.value;
    UIFont * font = [UIFont fontWithName:self.currentFontName size:value];
    self.txtLabel.font = font;
    
    CGSize size = [self.txt sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];

    CGRect frame = self.txtLabel.frame;
    frame.size.width = (size.width >= 540) ? size.width : 540;
    frame.size.height = (size.height >= 470) ? size.height : 470;
    
    self.txtLabel.frame = frame;
    self.fontSizeView.contentSize = CGSizeMake(size.width,size.height);
    
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.familyNamesArr count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * familyName = [self.familyNamesArr objectAtIndex:section];
    NSArray * fontNames = [UIFont fontNamesForFamilyName:familyName];
    return [fontNames count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    int row = indexPath.row;
    int section = indexPath.section;
    
    NSString * familyName = [self.familyNamesArr objectAtIndex:section];
    NSArray * fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = [fontNames objectAtIndex:row];
    NSLog(@"fontName:%@",fontName);
    
    if (!self.txt || [self.txt isEqualToString:@""]) self.txt = @"Hello EveryOne!";
    
    cell.textLabel.text = self.txt;
    cell.textLabel.font = [UIFont fontWithName:fontName size:21];
    
    if ([self.currentFontName isEqualToString:fontName]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

#pragma mark TableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    int section = indexPath.section;
    
    
    NSArray * cells = [tableView visibleCells];
    for (UITableViewCell * cell in cells) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    UITableViewCell  *cell =  [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString * familyName = [self.familyNamesArr objectAtIndex:section];
    NSArray * fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = [fontNames objectAtIndex:row];
    
    self.currentFontName = fontName;
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
