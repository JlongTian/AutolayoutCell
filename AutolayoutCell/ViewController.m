//
//  ViewController.m
//  AutolayoutCell
//
//  Created by 张天龙 on 17/3/1.
//  Copyright © 2017年 张天龙. All rights reserved.
//

#import "ViewController.h"
#import "JLStasus.h"
#import "JLStausCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *statuses;

@end

@implementation ViewController

- (NSArray *)statuses
{
    if (_statuses == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *statusArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            JLStasus *status = [JLStasus statusWithDict:dict];
            [statusArray addObject:status];
        }
        
        _statuses = statusArray;
    }
    return _statuses;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLStausCell *cell = [JLStausCell cellWithTableView:tableView];
    cell.status = self.statuses[indexPath.row];
    return cell;
}

#pragma mark - 代理方法
/**
 *  返回每一行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLStasus *staus = self.statuses[indexPath.row];
    return staus.cellHeight;
}

/**
 * 返回每一行的估计高度
 * 只要返回了估计高度，那么就会先调用tableView:cellForRowAtIndexPath:方法创建cell，再调用tableView:heightForRowAtIndexPath:方法获取cell的真实高度
 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
