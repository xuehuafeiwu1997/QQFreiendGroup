//
//  FriendListViewController.h
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface FriendListViewController : UIViewController

@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) NSArray *groups;

@end


NS_ASSUME_NONNULL_END
