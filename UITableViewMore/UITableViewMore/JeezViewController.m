//
//  JeezViewController.m
//  UICollectViewTest
//
//  Created by jeez on 2017/8/24.
//  Copyright © 2017年 jeez. All rights reserved.
//

#import "JeezViewController.h"

@interface JeezViewController ()

@end

@implementation JeezViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _contentView = [[UIView alloc]initWithFrame:rect];
    //    _contentView.backgroundColor = [UIColor colorWithRed:247./255. green:246./255. blue:242./255 alpha:1.];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_contentView];
    
   
    
    _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    _navView.backgroundColor = [UIColor orangeColor];
    [_contentView addSubview:_navView];
    
    _detailView = [[UIView alloc]initWithFrame:CGRectMake(0, _navView.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height - _navView.frame.size.height)];
    _detailView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _detailView.backgroundColor = [UIColor clearColor];
    [_contentView addSubview:_detailView];
    
    
    _keyLayoutView = [[UIView alloc]initWithFrame:_detailView.bounds];
    _keyLayoutView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _keyLayoutView.backgroundColor = [UIColor clearColor];
    [_detailView addSubview:_keyLayoutView];
    
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
    tap.cancelsTouchesInView = NO;
    [_keyLayoutView addGestureRecognizer:tap];
    
    self.scrollView  = [[UIScrollView alloc] initWithFrame:self.detailView.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.scrollView.backgroundColor = [UIColor clearColor];
    //    aScrollView.contentSize = CGSizeMake(aScrollView.frame.size.width, Screen_height + 160);
    self.scrollView.alwaysBounceVertical = YES;
    [self.keyLayoutView addSubview:self.scrollView];
    
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
  
    
}



- (void)tapGesture
{
    [self.view endEditing:YES];
}
#pragma mark Responding to keyboard events
//键盘通知事件
- (void)keyboardWillChangeFrame:(NSNotification*)notification
{
    if ([self currentFirstResponder])
    {
        float changeHeight = 0.0;
        NSDictionary *info = [notification userInfo];
        NSValue *valueEnd = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
        NSNumber *duration = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
        CGRect rectEnd = [valueEnd CGRectValue];
        CGRect main = self.view.window.frame;
        changeHeight = main.size.height - rectEnd.origin.y;
        if (changeHeight < 0)
        {
            changeHeight = 0;
        }
        [UIView animateWithDuration:[duration doubleValue] animations:^{
            _keyLayoutView.frame = CGRectMake(0, 0, _detailView.frame.size.width, _detailView.frame.size.height-changeHeight);
        } completion:^(BOOL finished) {
            [self getFirstResponder:self.scrollView];
        }];
    }
    
//    
//    CGRect endKeyboard = [notification.userInfo [UIKeyboardFrameEndUserInfoKey]CGRectValue];
//    CGFloat offsetY = endKeyboard.origin.y- [UIScreen mainScreen].bounds.size.height;
//    CGFloat animaDuration = [notification.userInfo [UIKeyboardFrameEndUserInfoKey]floatValue];
//    [UIView animateWithDuration:animaDuration animations:^{
//       
//        int curve = [notification.userInfo [UIKeyboardFrameEndUserInfoKey]intValue];
//        [UIView setAnimationCurve:curve];
//        self.keyBoardTool.transform = CGAffineTransformMarkTranSlation(0,offsetY);
//        
//        
//    }];
    
}
//获取scrollView的第一响应移屏
-(void)getFirstResponder:(UIView*)view
{
    for (UIView *subView in view.subviews)
    {
        if ([subView isFirstResponder])
        {
            CGRect rect;
            if ([self.scrollView.subviews containsObject:subView])
            {
                rect = subView.frame;
            }
            else
            {
                rect = [self.scrollView convertRect:subView.frame fromView:subView.superview];
            }
            
            if(CGRectGetMaxY(rect) > self.scrollView.frame.size.height+self.scrollView.contentOffset.y)
            {
                //rect.size.height+rect.origin.y
                CGPoint point = CGPointMake(self.scrollView.contentOffset.x, CGRectGetMaxY(rect)-self.scrollView.frame.size.height);
                [self.scrollView setContentOffset:point animated:YES];
            }
            return;
        }
        [self getFirstResponder:subView];
    }
}
- (BOOL)currentFirstResponder
{
   
    
    return NO;
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
