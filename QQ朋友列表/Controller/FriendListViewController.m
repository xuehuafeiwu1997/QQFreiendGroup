//
//  FriendListViewController.m
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "FriendListViewController.h"
#import "GroupModel.h"
#import "FriendModel.h"
#import "FriendTableViewCell.h"
#import "CustomHeaderFooterView.h"
#import "FriendListViewModel.h"

@interface FriendListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) FriendListViewModel *viewModel;

@end

@implementation FriendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"QQ好友列表";
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDelegate/dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupModel *group = self.viewModel.groups[section];
    if (group.visible) {
        return group.friends.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendTableViewCell"];
    GroupModel *group = self.viewModel.groups[indexPath.section];
    FriendModel *friend = group.friends[indexPath.row];
    cell.friendModel = friend;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CustomHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CustomHeaderFooterView"];
    GroupModel *group = self.viewModel.groups[section];
    __weak typeof(self) weakself = self;
    view.groupHeaderViewDidClick = ^(CustomHeaderFooterView * _Nonnull headerView) {
        __strong typeof(weakself) self = weakself;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerView.tag];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    };
    view.group = group;
    view.tag = section;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, State_Bar_H, SCREENWIDTH, SCREENHEIGHT - State_Bar_H - SafeAreaBottom_H) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:[FriendTableViewCell class] forCellReuseIdentifier:@"FriendTableViewCell"];
    [_tableView registerClass:[CustomHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"CustomHeaderFooterView"];
    return _tableView;
}

- (FriendListViewModel *)viewModel {
    if (_viewModel) {
        return _viewModel;
    }
    _viewModel = [[FriendListViewModel alloc] init];
    return _viewModel;
}
@end
