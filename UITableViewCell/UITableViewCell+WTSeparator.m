//
//  UITableViewCell+WTSeparator.m
//  UITableViewCell+Separator
//
//  Created by Wynter on 2017/8/12.
//  Copyright © 2017年 Wynter. All rights reserved.
//

#import "UITableViewCell+WTSeparator.h"
#import <objc/runtime.h>

@implementation UITableViewCell (WTSeparator)

- (void)addCustomSeparatorWithMode:(WTTbaleViewCellSeparateMode)mode inset:(UIEdgeInsets)inset color:(UIColor *)color height:(CGFloat)height {
    if (self.separatorView) {
        [self.separatorView removeFromSuperview];
        [self.separatorView removeConstraints:self.separatorView.constraints];
    }
    
    CGFloat defaultHeight = 0.5f;
    UIColor *defaultColor = [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1];
    self.separatorView.backgroundColor = color ?: defaultColor;
    [self addSubview:self.separatorView];
    
    self.separatorView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *viewTop = [NSLayoutConstraint constraintWithItem:self.separatorView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:inset.top];
    NSLayoutConstraint *viewLeft = [NSLayoutConstraint constraintWithItem:self.separatorView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:inset.left];
    NSLayoutConstraint *viewBottom = [NSLayoutConstraint constraintWithItem:self.separatorView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:inset.bottom];
    NSLayoutConstraint *viewRight = [NSLayoutConstraint constraintWithItem:self.separatorView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:inset.right];
    NSLayoutConstraint *viewHeight = [NSLayoutConstraint constraintWithItem:self.separatorView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:height ?: defaultHeight];
    [self addConstraint:viewLeft];
    [self addConstraint:viewRight];
    [self.separatorView addConstraint:viewHeight];
    switch (mode) {
        case WTTbaleViewCellSeparateModeNone:
            [self.separatorView removeFromSuperview];
            break;
        case WTTbaleViewCellSeparateModeTop:
            [self addConstraint:viewTop];
            break;
        case WTTbaleViewCellSeparateModeBottom:
            [self addConstraint:viewBottom];
            break;
    }
}

- (UIView *)separatorView {
    UIView *view = objc_getAssociatedObject(self, @selector(separatorView));
    if (!view) {
        view = [[UIView alloc]init];
        objc_setAssociatedObject(self, @selector(separatorView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return view;
}

@end
