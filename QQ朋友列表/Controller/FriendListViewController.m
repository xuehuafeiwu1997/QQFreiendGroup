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

@interface FriendListViewController ()

@property (nonatomic,strong) FriendListViewModel *viewModel;

@end

@implementation FriendListViewController



- (UITableView *)tv {
    if (!_tv) {
        _tv = [[UITableView alloc] initWithFrame:CGRectMake(0,State_Bar_H, SCREENWIDTH, SCREENHEIGHT - State_Bar_H - SafeAreaBottom_H) style:UITableViewStylePlain];
        _tv.dataSource = self.viewModel;
        _tv.delegate = self.viewModel;
        _tv.showsVerticalScrollIndicator = NO;
        _tv.sectionHeaderHeight = 44;
    }
    return _tv;
}

- (FriendListViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[FriendListViewModel alloc] init];
        
        /*
         *这句代码也比较重要，因为这是建立viewModel和viewcontroller之间的联系，如果不写，则得不到数据，这时也会调用协议的相关数据，但是行数和组数都为0
         */
        _viewModel.viewController = self;
    }
    return _viewModel;
}

//读取plist的值
- (NSArray *)groups {
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *arrayDicts = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDicts) {
            
            //通过字典来创建一个模型,使用的是第三方框架中的方法
            GroupModel *group = [GroupModel mj_objectWithKeyValues:dict];
            [arrModels addObject:group];
        }
        _groups = [arrModels copy];
    }
    return _groups;
}
/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupModel *group = self.groups[section];
    if (group.visible) {
        return group.friends.count;
    } else {
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupModel *group = self.groups[indexPath.section];
    FriendModel *friend = group.friends[indexPath.row];
    FriendTableViewCell *cell = [FriendTableViewCell friendTableViewCellWithTableView:tableView];
    cell.friendModel = friend;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    GroupModel *group = self.groups[section];
    CustomHeaderFooterView *view = [CustomHeaderFooterView headFooterViewWithTableView:tableView];
    
    //实现block方法
    //__weak typeof(self) weakself = self;
    view.groupHeaderViewDidClick = ^(CustomHeaderFooterView * _Nonnull headerView) {
        //@strongify(self);
        //局部刷新
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerView.tag];
        NSLog(@"要刷新的组别为：%@",indexSet);
        [self.tv reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        
        NSLog(@"执行block成功");
    };
    //view.delegate = self;
    view.group = group;
    view.tag = section;
    
    //return 返回之前headerFooterView的frame是0,所以需要在某个地方设置headerFooterView的frame
    return view;
    //return 返回之后，uitableview在用headerFooterView的时候就会设置headerFooterView的frame
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"QQ好友列表";
    [self.view addSubview:self.tv];
}



//调用的协议的方法
//- (void)groupHeaderViewDidClickTitleButton:(CustomHeaderFooterView *)headerview {
//    //局部刷新
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerview.tag];
//    NSLog(@"要刷新的组别为：%@",indexSet);
//    [self.tv reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
//}


@end
