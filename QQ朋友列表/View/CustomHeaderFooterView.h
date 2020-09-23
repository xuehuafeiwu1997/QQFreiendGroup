//
//  CustomHeaderFooterView.h
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic,strong) GroupModel *group;

//声明一个block属性
@property (nonatomic,copy)void(^groupHeaderViewDidClick)(CustomHeaderFooterView *headerView);

@end

NS_ASSUME_NONNULL_END
