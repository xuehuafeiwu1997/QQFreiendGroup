//
//  ViewController.m
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "ViewController.h"
#import "FriendListViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button.center = self.view.center;
    [self.view addSubview:self.button];
}

- (void)goQQ {
    FriendListViewController *friendlist = [[FriendListViewController alloc] init];
    [self.navigationController pushViewController:friendlist animated:YES];
}

- (UIButton *)button {
    if (_button) {
        return _button;
    }
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    _button.backgroundColor = [UIColor blackColor];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button setTitle:@"QQ好友列表" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(goQQ) forControlEvents:UIControlEventTouchUpInside];
    return _button;
}


@end
