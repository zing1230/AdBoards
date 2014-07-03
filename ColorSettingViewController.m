//
//  ColorSettingViewController.m
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "ColorSettingViewController.h"

typedef enum
{
    CUR_MODEL_FONT_COLOR,
    CUR_MODEL_BACKGROUND_COLOR
}CUR_MODEL;


@interface ColorSettingViewController ()

@property (nonatomic , strong) UILabel * txtLabel;
@property (nonatomic , strong) NSMutableArray * allColors;
@property (nonatomic , strong) UIImageView * selectedBg;
@property (nonatomic , assign) CUR_MODEL curModel;


@property (nonatomic , strong) UISlider * redSlider;
@property (nonatomic , strong) UISlider * greenSlider;
@property (nonatomic , strong) UISlider * blueSlider;


@property (nonatomic , strong) UITextField * redField;
@property (nonatomic , strong) UITextField * greenField;
@property (nonatomic , strong) UITextField * blueField;

//@property (nonatomic , assign) float font_redValue;
//@property (nonatomic , assign) float font_greenValue;
//@property (nonatomic , assign) float font_blueValue;
//
//@property (nonatomic , assign) float bg_redValue;
//@property (nonatomic , assign) float bg_greenValue;
//@property (nonatomic , assign) float bg_blueValue;

@end

@implementation ColorSettingViewController

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
    self.title = @"颜色设置";
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(saveBtnPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UISegmentedControl * segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"字体颜色",@"背景色"]];
    segmentedControl.frame = CGRectMake(150, 60, 240, 30);
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self action:@selector(segmentedControlSelected:) forControlEvents:UIControlEventValueChanged];
    //    segmentedControl.tintColor = [UIColor redColor];
    [self.view addSubview:segmentedControl];
    
    self.curModel = CUR_MODEL_FONT_COLOR;
    
    [self initTxtLabel];
    [self initColorBlocks];
    [self initSliderView];
}

- (void)saveBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    self.colorSetting(self.font_redValue,self.font_greenValue,self.font_blueValue,self.bg_redValue,self.bg_greenValue,self.bg_blueValue,self);
    
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
            self.curModel = CUR_MODEL_FONT_COLOR;
            
            self.redSlider.value = 255 * self.font_redValue;
            self.greenSlider.value = 255 * self.font_greenValue;
            self.blueSlider.value = 255 * self.font_blueValue;
            
            self.redField.text = [NSString stringWithFormat:@"%0.f",255 * self.font_redValue];
            self.greenField.text = [NSString stringWithFormat:@"%0.f",255 * self.font_greenValue];
            self.blueField.text = [NSString stringWithFormat:@"%0.f",255 * self.font_blueValue];
        }
            break;
        case 1:
        {
            self.curModel = CUR_MODEL_BACKGROUND_COLOR;
            
            self.redSlider.value = 255 * self.bg_redValue;
            self.greenSlider.value = 255 * self.bg_greenValue;
            self.blueSlider.value = 255 * self.bg_blueValue;
            
            self.redField.text = [NSString stringWithFormat:@"%0.f",255 * self.bg_redValue];
            self.greenField.text = [NSString stringWithFormat:@"%0.f",255 * self.bg_greenValue];
            self.blueField.text = [NSString stringWithFormat:@"%0.f",255 * self.bg_blueValue];
        }
            break;
    }
}

- (void)initTxtLabel
{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 104, 500, 100)];
    scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollView];
    
    self.txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 100)];
    self.txt = [self.txt stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    self.txtLabel.text = self.txt;
    
    self.txtLabel.backgroundColor = [UIColor colorWithRed:self.bg_redValue  green:self.bg_greenValue  blue:self.bg_blueValue alpha:1];
    
    self.txtLabel.textColor =  [UIColor colorWithRed:self.font_redValue green:self.font_greenValue  blue:self.font_blueValue alpha:1];
    
    self.txtLabel.font = [UIFont fontWithName:self.fontName size:50];
    self.txtLabel.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:self.txtLabel];
    
    CGSize size = [self.txt sizeWithFont:[UIFont fontWithName:self.fontName size:50] constrainedToSize:CGSizeMake(MAXFLOAT, 100)];
    
    CGRect frame = self.txtLabel.frame;
    frame.size.width = size.width;
    self.txtLabel.frame = frame;
    scrollView.contentSize = CGSizeMake(size.width, 100);
    
    
}

- (void)initColorBlocks
{
    //    + (UIColor *)blackColor;      // 0.0 white
    //    + (UIColor *)whiteColor;      // 1.0 white
    //    + (UIColor *)redColor;        // 1.0, 0.0, 0.0 RGB
    //    + (UIColor *)greenColor;      // 0.0, 1.0, 0.0 RGB
    //    + (UIColor *)blueColor;       // 0.0, 0.0, 1.0 RGB
    //    + (UIColor *)cyanColor;       // 0.0, 1.0, 1.0 RGB
    //    + (UIColor *)yellowColor;     // 1.0, 1.0, 0.0 RGB
    
    self.allColors = [[NSMutableArray alloc] init];
    [self.allColors addObject:[UIColor blackColor]];
    [self.allColors addObject:[UIColor whiteColor]];
    [self.allColors addObject:[UIColor redColor]];
    [self.allColors addObject:[UIColor greenColor]];
    [self.allColors addObject:[UIColor blueColor]];
    [self.allColors addObject:[UIColor cyanColor]];
    [self.allColors addObject:[UIColor yellowColor]];
    
    int width = 63;
    for (int i = 0; i < [self.allColors count]; i ++) {
        int row = i / 7;
        int col = i % 7;
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(18 + (width + 10) * col, 230 + row * (width + 20), width, width)];
        btn.tag = i;
        [btn setBackgroundColor:[self.allColors objectAtIndex:i]];
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 5;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(colorSelectedBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)colorSelectedBtnPressed:(UIButton *)sender
{
    int index = sender.tag;
    switch (index) {
        case 0:
        {
            switch (self.curModel) {
                case CUR_MODEL_FONT_COLOR:
                {
                    self.font_redValue = 0.0;
                    self.font_greenValue = 0.0;
                    self.font_blueValue = 0.0;
                    
                    [self refreshTextColor];
                }
                    break;
                case CUR_MODEL_BACKGROUND_COLOR:
                {
                    self.bg_redValue = 0.0;
                    self.bg_greenValue = 0.0;
                    self.bg_blueValue = 0.0;
                    [self refreshBgColor];
                    
                }
                    break;
            }
        }
            break;
        case 1:
        {
            switch (self.curModel) {
                case CUR_MODEL_FONT_COLOR:
                {
                    self.font_redValue = 1.0;
                    self.font_greenValue = 1.0;
                    self.font_blueValue = 1.0;
                    [self refreshTextColor];
                    
                    
                }
                    break;
                case CUR_MODEL_BACKGROUND_COLOR:
                {
                    self.bg_redValue = 1.0;
                    self.bg_greenValue = 1.0;
                    self.bg_blueValue = 1.0;
                    [self refreshBgColor];
                    
                }
                    break;
            }
            
            
        }
            break;
        case 2:
        {
            switch (self.curModel) {
                case CUR_MODEL_FONT_COLOR:
                {
                    self.font_redValue = 1.0;
                    self.font_greenValue = 0.0;
                    self.font_blueValue = 0.0;
                    
                    [self refreshTextColor];
                }
                    break;
                case CUR_MODEL_BACKGROUND_COLOR:
                {
                    self.bg_redValue = 1.0;
                    self.bg_greenValue = 0.0;
                    self.bg_blueValue = 0.0;
                    [self refreshBgColor];
                    
                }
                    break;
            }
            
            
        }
            break;
        case 3:
        {
            switch (self.curModel) {
                case CUR_MODEL_FONT_COLOR:
                {
                    self.font_redValue = 0.0;
                    self.font_greenValue = 1.0;
                    self.font_blueValue = 0.0;
                    
                    [self refreshTextColor];
                    
                }
                    break;
                case CUR_MODEL_BACKGROUND_COLOR:
                {
                    self.bg_redValue = 0.0;
                    self.bg_greenValue = 1.0;
                    self.bg_blueValue = 0.0;
                    [self refreshBgColor];
                }
                    break;
            }
            
        }
            break;
        case 4:
        {
            switch (self.curModel) {
                case CUR_MODEL_FONT_COLOR:
                {
                    self.font_redValue = 0.0;
                    self.font_greenValue = 0.0;
                    self.font_blueValue = 1.0;
                    
                    [self refreshTextColor];
                    
                }
                    break;
                case CUR_MODEL_BACKGROUND_COLOR:
                {
                    self.bg_redValue = 0.0;
                    self.bg_greenValue = 0.0;
                    self.bg_blueValue = 1.0;
                    [self refreshBgColor];
                    
                }
                    break;
            }
            
            
        }
            break;
        case 5:
        {
            switch (self.curModel) {
                case CUR_MODEL_FONT_COLOR:
                {
                    self.font_redValue = 0.0;
                    self.font_greenValue = 1.0;
                    self.font_blueValue = 1.0;
                    
                    [self refreshTextColor];
                    
                }
                    break;
                case CUR_MODEL_BACKGROUND_COLOR:
                {
                    self.bg_redValue = 0.0;
                    self.bg_greenValue = 1.0;
                    self.bg_blueValue = 1.0;
                    
                    [self refreshBgColor];
                    
                }
                    break;
            }
            
            
        }
            break;
        case 6:
        {
            switch (self.curModel) {
                case CUR_MODEL_FONT_COLOR:
                {
                    self.font_redValue = 1.0;
                    self.font_greenValue = 1.0;
                    self.font_blueValue = 0.0;
                    
                    
                    [self refreshTextColor];
                    
                }
                    break;
                case CUR_MODEL_BACKGROUND_COLOR:
                {
                    self.bg_redValue = 1.0;
                    self.bg_greenValue = 1.0;
                    self.bg_blueValue = 0.0;
                    
                    [self refreshBgColor];
                    
                }
                    break;
            }
            
            
        }
            break;
            
        default:
            break;
    }
}

- (void)refreshTextColor
{
    self.txtLabel.textColor = [UIColor colorWithRed:self.font_redValue green:self.font_greenValue blue:self.font_blueValue alpha:1.0f];
    
    self.redField.text = [NSString stringWithFormat:@"%0.f",255 * self.font_redValue];
    self.greenField.text = [NSString stringWithFormat:@"%0.f",255 * self.font_greenValue];
    self.blueField.text = [NSString stringWithFormat:@"%0.f",255 * self.font_blueValue];
    
    self.redSlider.value = 255 * self.font_redValue;
    self.greenSlider.value = 255 * self.font_greenValue;
    self.blueSlider.value = 255 * self.font_blueValue;
    
}

- (void)refreshBgColor
{
    self.txtLabel.backgroundColor = [UIColor colorWithRed:self.bg_redValue green:self.bg_greenValue blue:self.bg_blueValue alpha:1.0f];
    
    self.redField.text = [NSString stringWithFormat:@"%0.f",255 * self.bg_redValue];
    self.greenField.text = [NSString stringWithFormat:@"%0.f",255 * self.bg_greenValue];
    self.blueField.text = [NSString stringWithFormat:@"%0.f",255 * self.bg_blueValue];
    
    self.redSlider.value = 255 * self.bg_redValue;
    self.greenSlider.value = 255 * self.bg_greenValue;
    self.blueSlider.value = 255 * self.bg_blueValue;
}

- (void)initSliderView
{
    float originY = 350;
    
    //red
    UILabel * redLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, originY + 5, 50, 20)];
    redLabel.backgroundColor = [UIColor whiteColor];
    redLabel.text = @"Red";
    redLabel.textAlignment = NSTextAlignmentRight;
    redLabel.textColor = [UIColor redColor];
    [self.view addSubview:redLabel];
    
    self.redSlider = [[UISlider alloc] initWithFrame:CGRectMake(70, originY, 350, 30)];
    self.redSlider.minimumValue = 0;
    self.redSlider.maximumValue = 255;
    [self.redSlider addTarget:self action:@selector(redSliederValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.redSlider];
    
    self.redField = [[UITextField alloc] initWithFrame:CGRectMake(440, originY, 70, 30)];
    self.redField.borderStyle = UITextBorderStyleRoundedRect;
    self.redField.textAlignment = NSTextAlignmentCenter;
    self.redField.text = @"0";
    self.redField.enabled = NO;
    [self.view addSubview:self.redField];
    
    //green
    UILabel * greenLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, originY + 55, 50, 20)];
    greenLabel.backgroundColor = [UIColor whiteColor];
    greenLabel.text = @"Green";
    greenLabel.textAlignment = NSTextAlignmentRight;
    greenLabel.textColor = [UIColor greenColor];
    [self.view addSubview:greenLabel];
    
    self.greenSlider = [[UISlider alloc] initWithFrame:CGRectMake(70, originY + 50, 350, 30)];
    self.greenSlider.minimumValue = 0;
    self.greenSlider.maximumValue = 255;
    [self.greenSlider addTarget:self action:@selector(greenSliederValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.greenSlider];
    
    self.greenField = [[UITextField alloc] initWithFrame:CGRectMake(440, originY + 50, 70, 30)];
    self.greenField.borderStyle = UITextBorderStyleRoundedRect;
    self.greenField.textAlignment = NSTextAlignmentCenter;
    self.greenField.text = @"0";
    self.greenField.enabled = NO;
    [self.view addSubview:self.greenField];
    
    //blue
    UILabel * blueLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, originY + 105, 50, 20)];
    blueLabel.backgroundColor = [UIColor whiteColor];
    blueLabel.text = @"Blue";
    blueLabel.textAlignment = NSTextAlignmentRight;
    blueLabel.textColor = [UIColor blueColor];
    [self.view addSubview:blueLabel];
    
    self.blueSlider = [[UISlider alloc] initWithFrame:CGRectMake(70, originY + 100, 350, 30)];
    self.blueSlider.minimumValue = 0;
    self.blueSlider.maximumValue = 255;
    [self.blueSlider addTarget:self action:@selector(blueSliederValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.blueSlider];
    
    self.blueField = [[UITextField alloc] initWithFrame:CGRectMake(440, originY + 100, 70, 30)];
    self.blueField.borderStyle = UITextBorderStyleRoundedRect;
    self.blueField.textAlignment = NSTextAlignmentCenter;
    self.blueField.text = @"0";
    self.blueField.enabled = NO;
    [self.view addSubview:self.blueField];
    
    [self refreshTextColor];
}



- (void)redSliederValueChanged:(UISlider *)sender
{
    float value = sender.value;
    self.redField.text = [NSString stringWithFormat:@"%.0f",value];
    
    switch (self.curModel) {
        case CUR_MODEL_FONT_COLOR:
        {
            self.font_redValue = value / 255.0f;
            self.txtLabel.textColor = [UIColor colorWithRed:self.font_redValue green:self.font_greenValue blue:self.font_blueValue alpha:1.0f];
        }
            break;
        case CUR_MODEL_BACKGROUND_COLOR:
        {
            self.bg_redValue = value / 255.0f;
            self.txtLabel.backgroundColor = [UIColor colorWithRed:self.bg_redValue green:self.bg_greenValue blue:self.bg_blueValue alpha:1.0f];
        }
            break;
    }
    
    
    
}

- (void)greenSliederValueChanged:(UISlider *)sender
{
    float value = sender.value;
    self.greenField.text = [NSString stringWithFormat:@"%.0f",value];
    
    switch (self.curModel) {
        case CUR_MODEL_FONT_COLOR:
        {
            self.font_greenValue = value / 255.0f;
            self.txtLabel.textColor = [UIColor colorWithRed:self.font_redValue green:self.font_greenValue blue:self.font_blueValue alpha:1.0f];
        }
            break;
        case CUR_MODEL_BACKGROUND_COLOR:
        {
            self.bg_greenValue = value / 255.0f;
            self.txtLabel.backgroundColor = [UIColor colorWithRed:self.bg_redValue green:self.bg_greenValue blue:self.bg_blueValue alpha:1.0f];
        }
            break;
    }
    
}

- (void)blueSliederValueChanged:(UISlider *)sender
{
    float value = sender.value;
    self.blueField.text = [NSString stringWithFormat:@"%.0f",value];
    switch (self.curModel) {
        case CUR_MODEL_FONT_COLOR:
        {
            self.font_blueValue = value / 255.0f;
            self.txtLabel.textColor = [UIColor colorWithRed:self.font_redValue green:self.font_greenValue blue:self.font_blueValue alpha:1.0f];
        }
            break;
        case CUR_MODEL_BACKGROUND_COLOR:
        {
            self.bg_blueValue = value / 255.0f;
            self.txtLabel.backgroundColor = [UIColor colorWithRed:self.bg_redValue green:self.bg_greenValue blue:self.bg_blueValue alpha:1.0f];
        }
            break;
    }
}

- (void)getColorSetting:(void(^)(float fontRedValue , float fontGreenValue ,float fontBlueValue , float bgRedValue ,float bgGreenValue ,float bgBlueValue ,ColorSettingViewController * controller)) block
{
    self.colorSetting = [block copy];
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
