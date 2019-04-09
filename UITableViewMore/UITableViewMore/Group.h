//
//  Group.h
//  UITableViewMore
//
//  Created by jeez on 2017/4/21.
//  Copyright © 2017年 jeez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic,copy)NSString *groupName;
@property(nonatomic,strong)NSMutableArray *friendArray;

@property(nonatomic,assign)BOOL isHide;  //是否隐藏，默认为NO

@end
