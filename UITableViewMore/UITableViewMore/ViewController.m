//
//  ViewController.m
//  UITableViewMore
//
//  Created by jeez on 2017/4/21.
//  Copyright © 2017年 jeez. All rights reserved.
//

#import "ViewController.h"
#import "Group.h"
#import "SelectViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView *tableView1;
    NSMutableArray *_dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 375, 603) style:UITableViewStyleGrouped];
    tableView1.delegate = self;
    tableView1.dataSource = self;
    [self.view addSubview:tableView1];
    
    UIView *headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 50)];
    headview.backgroundColor = [[UIColor orangeColor]colorWithAlphaComponent:0.5];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 20)];
    label.text = @"duantou";
    label.textAlignment = NSTextAlignmentLeft;
    [headview addSubview:label];
    
    tableView1.tableHeaderView = headview;
     [self createData];
    
}

- (void)createData{

    _dataArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<3; i++) {
        Group *group = [[Group alloc]init];
        group.isHide = YES;
        group.groupName = [NSString stringWithFormat:@"好友列表%d",i];
        for (int j=0; j<3; j++) {
            NSString *str = [NSString stringWithFormat:@"第%d段 第%d行",i,j];
            [group.friendArray addObject:str];
        
        }
        [_dataArray addObject:group];
        
    }
    
    

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    Group *groupModel = _dataArray[section];
    if(groupModel.isHide)
    {
        return 0;
    }
    
    //根据组，得出每组的行
    return groupModel.friendArray.count;   //3行

    

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _dataArray.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    Group *groupModel = _dataArray[indexPath.section];
    //在段中求是第几行
    NSString *str = groupModel.friendArray[indexPath.row];

    cell.textLabel.text = str;
    
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    SelectViewController *selectVC = [[SelectViewController alloc]init];
    selectVC.indexPath = indexPath;
    [self presentViewController:selectVC animated:YES completion:nil];
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 40;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    Group *groupModel = _dataArray[section];
    if(groupModel.isHide)
    {
        return 0.00000001;
      
    }

    return 40;

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
    headView.backgroundColor = [UIColor orangeColor];
    headView.tag = 100+section;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 100, 20)];
    label.numberOfLines = 0;
    label.textColor = [UIColor blueColor];
    [headView addSubview:label];
    Group *groupModel = _dataArray[section];
    label.text = groupModel.groupName;
    
    //手势触发缩放
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapgr:)];
    headView.userInteractionEnabled = YES;
    [headView addGestureRecognizer:tap];
    
    if(groupModel.isHide)
    {
        //隐藏
        headView.backgroundColor = [UIColor orangeColor];
    }else{
        //不隐藏
        headView.backgroundColor = [UIColor greenColor];
          }

    
    return headView;


}
-(void)tapgr:(UITapGestureRecognizer *)tap{

    UIView *headView = (UIView *)tap.view;
    Group *group = _dataArray[headView.tag-100];
     group.isHide = !group.isHide;
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headView.tag-100];
    [tableView1 reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    UIView *footview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
    footview.tag = 200+section;
    footview.backgroundColor = [UIColor blueColor];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foottapgr:)];
    footview.userInteractionEnabled = YES;
    [footview addGestureRecognizer:tap1];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 100, 20)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"添加tableviewcell";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentLeft;
    [footview addSubview:label];
    
    Group *groupModel = _dataArray[section];
    if(groupModel.isHide)
    {
        return nil;
        
    }

    
    return footview;

}
- (void)foottapgr:(UITapGestureRecognizer *)tap{

    UIView *headView = (UIView *)tap.view;
    Group *group = _dataArray[headView.tag-200];

    for (int j=0; j<3; j++) {
        NSString *str = [NSString stringWithFormat:@"第%d段 添加",j];
        [group.friendArray addObject:str];
        
    }
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headView.tag-200];
    [tableView1 reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
