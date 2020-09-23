//
//  FriendListViewModel.m
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/7.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "FriendListViewModel.h"
#import "GroupModel.h"

@implementation FriendListViewModel

- (NSArray *)groups {
    if (_groups) {
        return _groups;
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
    NSArray *arrayDicts = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dict in arrayDicts) {
        GroupModel *group = [GroupModel mj_objectWithKeyValues:dict];
        [mArr addObject:group];
    }
    _groups = mArr;
    return _groups;
}

@end
