//
//  FriendTableViewCell.h
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FriendModel;
NS_ASSUME_NONNULL_BEGIN

@interface FriendTableViewCell : UITableViewCell

@property (nonatomic,strong) FriendModel *friendModel;

+ (instancetype)friendTableViewCellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
