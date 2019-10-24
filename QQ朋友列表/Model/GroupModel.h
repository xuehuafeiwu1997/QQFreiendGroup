//
//  GroupModel.h
//  QQ朋友列表
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GroupModel : NSObject

@property (nonatomic,strong) NSArray<FriendModel *> *friends;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *online;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

+ (NSDictionary *)mj_objectClassInArray;

@property(nonatomic, assign,getter=isVisible) BOOL visible;
@end

NS_ASSUME_NONNULL_END
