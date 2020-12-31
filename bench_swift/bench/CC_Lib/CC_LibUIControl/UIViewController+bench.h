//
//  UIViewController+Bench.h
//  bench_swift
//
//  Created by gwh on 2020/12/30.
//

#import "CC_ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (bench)

@property (nonatomic, retain) CC_ViewController *controller;

//@property (nonatomic, strong) id parent;
@property (nonatomic, retain) NSString *navigationTitle;
@property (nonatomic, retain) CC_NavigationBar *navigationBar;
@property (nonatomic, retain, readonly) UIView *displayView;

// config
- (void)setupController;

@end

NS_ASSUME_NONNULL_END
