//
//  UITableViewCell+WTSeparator.h
//  UITableViewCell+Separator
//
//  Created by Wynter on 2017/8/12.
//  Copyright © 2017年 Wynter. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WTTbaleViewCellSeparateMode) {
    WTTbaleViewCellSeparateModeNone,
    WTTbaleViewCellSeparateModeTop,
    WTTbaleViewCellSeparateModeBottom
};

@interface UITableViewCell (WTSeparator)

@property (nonatomic, readonly) UIView *separatorView;

/**
 添加自定义分割线

 @param mode 分割线类型 (cell 顶部和底部)
 @param inset 分割线边距 top值仅在WTTbaleViewCellSeparateModeTop时有用，bottom值仅在WTTbaleViewCellSeparateModeBottom时有用
 @param color 分割线颜色 默认值[UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1];
 @param height 分割线高度 默认高度0.5px
 */
- (void)addCustomSeparatorWithMode:(WTTbaleViewCellSeparateMode)mode inset:(UIEdgeInsets)inset color:(UIColor *)color height:(CGFloat)height;
@end
