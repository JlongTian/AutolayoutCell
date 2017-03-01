//
//  JLStasus.h
//  AutolayoutCell
//
//  Created by 张天龙 on 17/3/1.
//  Copyright © 2017年 张天龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLStasus : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *picture;
@property (assign, nonatomic, getter=isVip) BOOL vip;

/** cell的高度 */
@property (assign, nonatomic) CGFloat cellHeight;

+ (instancetype)statusWithDict:(NSDictionary *)dict;

@end
