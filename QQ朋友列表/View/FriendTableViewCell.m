//
//  FriendTableViewCell.m
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "FriendTableViewCell.h"
#import "FriendModel.h"

@implementation FriendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)friendTableViewCellWithTableView:(UITableView *)tableView {
    FriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FriendTableViewCell class])];
    if (cell == nil) {
        cell = [[FriendTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass([FriendTableViewCell class])];
        //设置单元格的选中效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)setFriendModel:(FriendModel *)friendModel {
    _friendModel = friendModel;
    NSLog(@"friendModel代表的含义:%@",friendModel);
    NSLog(@"icon代表的意思:%@",friendModel.icon);
    self.imageView.image = [UIImage imageNamed:friendModel.icon];
    self.textLabel.text = friendModel.name;
    self.detailTextLabel.text = friendModel.intro;
    
    NSString *isVip = [NSString stringWithFormat:@"%@",friendModel.vip];
    
    //如果是vip将字体颜色设为红色，如果不是VIP，将字体颜色设为黑色。
    if ([isVip isEqualToString:@"1"]) {
        self.detailTextLabel.textColor = [UIColor redColor];
    } else {
        self.detailTextLabel.textColor = [UIColor blackColor];
    }
    
}



@end
