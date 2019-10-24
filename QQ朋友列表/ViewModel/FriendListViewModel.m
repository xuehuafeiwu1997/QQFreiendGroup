//
//  FriendListViewModel.m
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/7.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "FriendListViewModel.h"
#import "FriendTableViewCell.h"
#import "CustomHeaderFooterView.h"

@implementation FriendListViewModel


#pragma mark - UITableViewDelegate/UITableViewDataSource

//返回组的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%lu",(unsigned long)self.viewController.groups.count);
    return  self.viewController.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    GroupModel *group = self.viewController.groups[section];
    if (group.visible) {
        return group.friends.count;
    } else {
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GroupModel *group = self.viewController.groups[indexPath.section];
    FriendModel *friend = group.friends[indexPath.row];
    
    FriendTableViewCell *cell = [FriendTableViewCell friendTableViewCellWithTableView:tableView];
    cell.friendModel = friend;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    GroupModel *group = self.viewController.groups[section];
    CustomHeaderFooterView *view = [CustomHeaderFooterView headFooterViewWithTableView:tableView];
    
    //实现block方法
    //__weak typeof(self) weakself = self;
    view.groupHeaderViewDidClick = ^(CustomHeaderFooterView * _Nonnull headerView) {
        //@strongify(self);
        //局部刷新
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerView.tag];
        NSLog(@"要刷新的组别为：%@",indexSet);
        [self.viewController.tv reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        
        NSLog(@"执行block成功");
    };
    //view.delegate = self;
    view.group = group;
    view.tag = section;
    
    return view;
}


@end
