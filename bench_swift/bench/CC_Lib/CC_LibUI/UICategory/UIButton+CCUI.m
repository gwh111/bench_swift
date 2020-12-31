//
//  UIButton+CCUI.m
//  CCUILib
//
//  Created by ml on 2019/9/2.
//  Copyright © 2019 Liuyi. All rights reserved.
//

#import "UIButton+CCUI.h"
#import "CC_Runtime.h"

@implementation UIButton (CCUI)

- (void)setTappedBlock:(void (^)(UIButton *))tappedBlock {
    [CC_Runtime cc_setObject:self key:@selector(tappedBlock) value:tappedBlock];
}

- (void (^)(UIButton *))tappedBlock {
    return [CC_Runtime cc_getObject:self key:@selector(tappedBlock)];
}

- (void)setFreezingTime:(float)freezingTime {
    [CC_Runtime cc_setObject:self key:@selector(freezingTime) value:@(freezingTime)];
}

- (float)freezingTime {
    return [[CC_Runtime cc_getObject:self key:@selector(freezingTime)]floatValue];
}

- (void)addTappedOnceDelay:(float)time withBlock:(void (^)(UIButton *btn))block {
    [self addTappedOnceDelay:time withBlock:block forControlEvents:UIControlEventTouchUpInside];
}

- (void)addTappedOnceDelay:(float)time
                    withBlock:(void (^)(UIButton *btn))block
             forControlEvents:(UIControlEvents)controlEvents {
    
    self.tappedBlock = block;
    self.freezingTime = time;
    [self addTarget:self
             action:@selector(_cc_tappedDelayMethod:)
   forControlEvents:controlEvents];
}

- (void)addTappedOnceWithBlock:(void (^)(UIButton *btn))block {
    [self addTappedOnceDelay:0.5 withBlock:block];
}

- (void)_cc_tappedDelayMethod:(UIButton *)button{
    !self.tappedBlock ? : self.tappedBlock(self);
    self.userInteractionEnabled = NO;
    
    UIImage *disableBgImg = [self backgroundImageForState:UIControlStateDisabled];
    UIImage *normalBgImg = [self backgroundImageForState:UIControlStateNormal];

    if(disableBgImg) {
        self.cc_setBackgroundImageForState(disableBgImg,UIControlStateNormal);
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.freezingTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
        
        if(disableBgImg) {
            self.cc_setBackgroundImageForState(disableBgImg,UIControlStateDisabled);
        }
        
        if (normalBgImg) {
            self.cc_setBackgroundImageForState(normalBgImg,UIControlStateNormal);
        }
    });
}

- (UIButton *(^)(NSString *))cc_setNormalTitle {
    return ^(NSString *_) { return self.cc_setTitleForState(_,UIControlStateNormal); };
}

- (UIButton *(^)(NSString *))cc_setHighlightedTitle {
    return ^(NSString *_) { return self.cc_setTitleForState(_,UIControlStateHighlighted); };
}

- (UIButton *(^)(NSString *))cc_setDisabledTitle {
    return ^(NSString *_) { return self.cc_setTitleForState(_,UIControlStateDisabled); };
}

- (UIButton *(^)(NSString *))cc_setSelectedTitle {
    return ^(NSString *_) { return self.cc_setTitleForState(_,UIControlStateSelected); };
}

- (UIButton *(^)(UIColor *))cc_setNormalTitleColor {
    return ^(UIColor *_) { return self.cc_setTitleColorForState(_,UIControlStateNormal); };
}

- (UIButton *(^)(UIColor *))cc_setHighlightedTitleColor {
    return ^(UIColor *_) { return self.cc_setTitleColorForState(_,UIControlStateHighlighted); };
}

- (UIButton *(^)(UIColor *))cc_setDisabledTitleColor {
    return ^(UIColor *_) { return self.cc_setTitleColorForState(_,UIControlStateDisabled); };
}

- (UIButton *(^)(UIColor *))cc_setSelectedTitleColor {
    return ^(UIColor *_) { return self.cc_setTitleColorForState(_,UIControlStateSelected); };
}

- (UIButton *(^)(UIImage *))cc_setNormalImage {
    return ^(UIImage *_) { return self.cc_setImageForState(_,UIControlStateNormal); };
}

- (UIButton *(^)(UIImage *))cc_setHighlightedImage {
    return ^(UIImage *_) { return self.cc_setImageForState(_,UIControlStateHighlighted); };
}

- (UIButton *(^)(UIImage *))cc_setDisabledImage {
    return ^(UIImage *_) { return self.cc_setImageForState(_,UIControlStateDisabled); };
}

- (UIButton *(^)(UIImage *))cc_setSelectedImage {
    return ^(UIImage *_) { return self.cc_setImageForState(_,UIControlStateSelected); };
}

- (UIButton *(^)(UIImage *))cc_setNormalBackgroundImage {
    return ^(UIImage *_) { return self.cc_setBackgroundImageForState(_,UIControlStateNormal); };
}

- (UIButton *(^)(UIImage *))cc_setHighlightedBackgroundImage {
    return ^(UIImage *_) { return self.cc_setBackgroundImageForState(_,UIControlStateHighlighted); };
}

- (UIButton *(^)(UIImage *))cc_setDisabledBackgroundImage {
    return ^(UIImage *_) { return self.cc_setBackgroundImageForState(_,UIControlStateDisabled); };
}

- (UIButton *(^)(UIImage *))cc_setSelectedBackgroundImage {
    return ^(UIImage *_) { return self.cc_setBackgroundImageForState(_,UIControlStateSelected); };
}

- (UIButton *(^)(UIColor *))cc_setNormalBackgroundColor {
    return ^(UIColor *_) { return self.cc_setBackgroundColorForState(_,UIControlStateNormal); };
}

- (UIButton *(^)(UIColor *))cc_setHighlightedBackgroundColor {
    return ^(UIColor *_) { return self.cc_setBackgroundColorForState(_,UIControlStateHighlighted); };
}

- (UIButton *(^)(UIColor *))cc_setDisabledBackgroundColor {
    return ^(UIColor *_) { return self.cc_setBackgroundColorForState(_,UIControlStateDisabled); };
}

- (UIButton *(^)(UIColor *))cc_setSelectedBackgroundColor {
    return ^(UIColor *_) { return self.cc_setBackgroundColorForState(_,UIControlStateSelected); };
}

- (UIButton *(^)(NSAttributedString *))cc_setNormalAttributedTitle {
    return ^(NSAttributedString *_) { return self.cc_setAttributedTitleForState(_,UIControlStateNormal); };
}

- (UIButton *(^)(NSAttributedString *))cc_setHighlightedAttributedTitle {
    return ^(NSAttributedString *_) { return self.cc_setAttributedTitleForState(_,UIControlStateHighlighted); };
}

- (UIButton *(^)(NSAttributedString *))cc_setDisabledAttributedTitle {
    return ^(NSAttributedString *_) { return self.cc_setAttributedTitleForState(_,UIControlStateHighlighted); };
}

- (UIButton *(^)(NSAttributedString *))cc_setSelectedAttributedTitle {
    return ^(NSAttributedString *_) { return self.cc_setAttributedTitleForState(_,UIControlStateSelected); };
}

- (UIButton *(^)(UIColor *color,UIControlState state))cc_setBackgroundColorForState {
    return ^(UIColor *backgroundColor,UIControlState state) {
        CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [backgroundColor CGColor]);
        CGContextFillRect(context, rect);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

- (UIButton *(^)(NSString *text,UIControlState state))cc_setTitleForState {
    return ^(NSString *t,UIControlState s) { [self setTitle:t forState:s]; return self; };
}

- (UIButton *(^)(UIColor *color,UIControlState state))cc_setTitleColorForState {
    return ^(UIColor *c,UIControlState s) { [self setTitleColor:c forState:s]; return self; };
}

- (UIButton *(^)(UIImage *image,UIControlState state))cc_setImageForState {
    return ^(UIImage *i,UIControlState s) { [self setImage:i forState:s]; return self; };
}

- (UIButton *(^)(UIImage *image,UIControlState state))cc_setBackgroundImageForState {
    return ^(UIImage *i,UIControlState s) { [self setBackgroundImage:i forState:s]; return self; };
}

- (UIButton *(^)(NSAttributedString *attributed,UIControlState state))cc_setAttributedTitleForState {
    return ^(NSAttributedString *a,UIControlState s) { [self setAttributedTitle:a forState:s]; return self; };
}

- (UIButton *(^)(UIColor *color,UIControlState state))cc_setTitleShadowColorForState {
    return ^(UIColor *c,UIControlState s) { [self setTitleShadowColor:c forState:s]; return self; };
}

- (UIButton *(^)(UIFont  *))cc_font {
    return ^(UIFont *_) { self.titleLabel.font = _; return self; };
}

@end

@implementation UIButton (CCDeprecated)

- (void)cc_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    self.cc_setBackgroundColorForState(backgroundColor,state);
}

@end
