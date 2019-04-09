//
//  JeezViewController.h
//  UICollectViewTest
//
//  Created by jeez on 2017/8/24.
//  Copyright © 2017年 jeez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JeezViewController : UIViewController
{
    UITapGestureRecognizer *tap;



}
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UIView *navView;
@property(nonatomic,strong)UIView *keyLayoutView;
@property(nonatomic,strong)UIView *detailView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSArray *tliVAy;
@property(nonatomic,strong)NSArray *firstGroupAy;
@property(nonatomic,strong)NSArray *secondGroupAy;
@property(nonatomic,strong)NSArray *thirdGroupAy;
@property(nonatomic,strong)NSArray *fourthGroupAy;


- (void)tapGesture;
- (BOOL)currentFirstResponder;




@end
