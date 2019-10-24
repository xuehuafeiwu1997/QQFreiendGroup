//
//  GroupModel.m
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "GroupModel.h"
#import "FriendModel.h"

@implementation GroupModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict_sub in self.friends) {
            FriendModel *model = [FriendModel friendWithDict:dict_sub];
            [arrayModels addObject:model];
        }
        self.friends = arrayModels;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSDictionary *)mj_objectClassInArray {
    //前面是属性数组的名字，后边是类
    //错误的原因在于写错了FriendModel
    return @{
             @"friends":@"FriendModel"
             };
}

@end
