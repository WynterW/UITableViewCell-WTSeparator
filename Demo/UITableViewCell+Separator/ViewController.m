//
//  ViewController.m
//  UITableViewCell+Separator
//
//  Created by Wynter on 2017/8/12.
//  Copyright © 2017年 Wynter. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+WTSeparator.h"

@interface ViewController () {
    NSArray *dataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dataSource = @[@"分割线在cell底部、左右铺满", @"分割线在cell底部、左右间距15px、分割线高度5px", @"无分割线", @"分割线在cell顶部、左右间距30px、分割线颜色红色、分割线高度5px"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.textLabel.numberOfLines = 0;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@、%@", @(row + 1), dataSource[row]];
    if (row == 0) {
        [cell addCustomSeparatorWithMode:WTTbaleViewCellSeparateModeBottom inset:UIEdgeInsetsZero color:nil height:0];
    } else if (row == 1) {
        [cell addCustomSeparatorWithMode:WTTbaleViewCellSeparateModeBottom inset:UIEdgeInsetsMake(0, 15, 0, -15) color:nil height:5];
    } else if (row == 2) {
        [cell addCustomSeparatorWithMode:WTTbaleViewCellSeparateModeNone inset:UIEdgeInsetsZero color:nil height:0];
    } else if (row == 3) {
        [cell addCustomSeparatorWithMode:WTTbaleViewCellSeparateModeTop inset:UIEdgeInsetsMake(0, 30, 0, -30) color:[UIColor redColor] height:5];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
