//
//  InputBoxViewController.m
//  AdBoards
//
//  Created by Sidney on 14-6-27.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "InputBoxViewController.h"

@interface InputBoxViewController ()
<UITextViewDelegate>

@property (nonatomic , strong) UITextView * txtView;

@end

@implementation InputBoxViewController

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
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(saveBtnPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.title = @"文本输入";
    self.txtView = [[UITextView alloc] initWithFrame:CGRectMake(0, 44, 540, 320)];
    self.txtView.font = [UIFont boldSystemFontOfSize:50];
//    self.txtView.returnKeyType = UIReturnKeyDone;
    self.txtView.delegate = self;
    [self.txtView becomeFirstResponder];
    
//    self.txtView.backgroundColor = [UIColor redColor];
    self.txtView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.txtView.layer.cornerRadius = 2;
    
    [self.view addSubview:self.txtView];
    self.txtView.text = self.txt;
    // Do any additional setup after loading the view.
}

- (void)saveBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    self.inputBoxContext(self.txtView.text,self);
}

- (void)getInputBoxContext:(void (^)(NSString * context , InputBoxViewController *controller)) block
{
    self.inputBoxContext = [block copy];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
//    if ([text isEqualToString:@"\n"]) {
//        [textView resignFirstResponder];
//        return NO;
//    }
    return YES;
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
