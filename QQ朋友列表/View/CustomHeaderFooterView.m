//
//  CustomHeaderFooterView.m
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "CustomHeaderFooterView.h"

@interface CustomHeaderFooterView()

@property (nonatomic,strong) UIButton *btnGroupTitle;
@property (nonatomic,strong) UILabel  *lblCount;

@end

@implementation CustomHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    //初始化父类构造方法
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *btnGroupTitle = [[UIButton alloc] init];
        [btnGroupTitle setImage:[UIImage imageNamed:@"sanjiaoxing-4.png"] forState:UIControlStateNormal];
        [btnGroupTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnGroupTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        //这两句话设置的不同在哪里
        [btnGroupTitle setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [btnGroupTitle setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [btnGroupTitle addTarget:self action:@selector(btnGroupTitleClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置按钮中图片的显示模式
        btnGroupTitle.contentMode = UIViewContentModeCenter;
        //设置图片超出的部分不要裁掉
        btnGroupTitle.imageView.clipsToBounds = NO;
        [self.contentView addSubview:btnGroupTitle];
        self.btnGroupTitle = btnGroupTitle;
        
        UILabel *lblCount = [[UILabel alloc] init];
        [self.contentView addSubview:lblCount];
        self.lblCount = lblCount;
    }
    return self;
}

- (void)btnGroupTitleClicked:(UIButton *)sender {
    NSLog(@"---%d",self.group.isVisible);
    //设置组状态,表示下面的组别是否展开
    self.group.visible = !self.group.isVisible;
    
    //执行block,将当前对象（即CustomHeaderFooterView传递进去）
    if (self.groupHeaderViewDidClick) {
        self.groupHeaderViewDidClick(self);
    }
}

//当一个新的headerView已经加到某个父控件的时候调用
- (void)didMoveToSuperview {
    if (self.group.isVisible) {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

- (void)setGroup:(GroupModel *)group {
    //设置frame不要在这里设置frame，因为这个时候的当前控件(self)的宽和高都是0
    _group = group;
    [self.btnGroupTitle setTitle:group.name forState:UIControlStateNormal];
    self.lblCount.text = [NSString stringWithFormat:@"%@/%lu",group.online,group.friends.count];
    if (self.group.isVisible) {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

//当前控件的frame发生改变的时候会调用这个方法
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.btnGroupTitle setFrame:self.bounds];
    CGFloat lblX = self.bounds.size.width - 10 - 100;
    [self.lblCount setFrame:CGRectMake(lblX, 0, 100, 44)];
}
@end

