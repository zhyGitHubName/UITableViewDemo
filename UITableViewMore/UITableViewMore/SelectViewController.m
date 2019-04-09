//
//  SelectViewController.m
//  UITableViewMore
//
//  Created by jeez on 2017/4/28.
//  Copyright © 2017年 jeez. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()
{
    UIView *view;
    UILabel *label;

}
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"dianji" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 300, 100, 30);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSString *str = @"";
    
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 10)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
   
   
    
}

- (void)btnclick:(UIButton *)button{

    button.selected = !button.selected;
    if (button.selected) {
        [UIView animateWithDuration:2 animations:^{
            view.frame = CGRectMake(0, 0, 375, 100);
            label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
            label.text = @"this is a good time in life";
            label.textColor = [UIColor redColor];
            label.numberOfLines = 0;
            [view addSubview:label];
        }];
    }else{
        [UIView animateWithDuration:2 animations:^{
            view.frame = CGRectMake(0, 0, 375, 0);
            for (UIView *view1 in view.subviews) {
                [view1 removeFromSuperview];
            }
        }];
    
    }


}

- (void)initUI{

    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    label1.numberOfLines = 0;
    label1.textColor = [UIColor greenColor];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.text = @"";
    [self.view addSubview:label1];
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
 
*/

@end
