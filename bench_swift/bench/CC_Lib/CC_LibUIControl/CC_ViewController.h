//
//  CCUIViewController.h
//  bench_ios
//
//  Created by gwh on 2019/7/26.
//  Copyright © 2019 Liuyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CC_Foundation.h"
#import "CC_Controller.h"
#import "CC_NavigationBar.h"
#import "CC_TabBarController.h"

@class CC_ScrollView, CC_View, CC_Controller, CC_TabBarController;

@interface CC_ViewController : UIViewController

//@property (nonatomic, strong) id parent;
@property (nonatomic, assign) BOOL cc_navigationBarHidden;
@property (nonatomic, retain) CC_ScrollView *cc_displayView;
@property (nonatomic, retain) NSMutableArray *cc_controllers;
@property (nonatomic, retain) CC_NavigationBar *cc_navigationBar;

// Configuration function, adds configuration to this function
// 配置函数 在此函数中添加配置
- (void)cc_registerController:(CC_Controller *)controller;
// 居中标题
@property (nonatomic,retain) NSString *cc_title;

// set initView
- (void)setupOnView:(UIView *)view;

- (void)cc_addSubview:(id)view;
- (CC_View *)cc_viewWithName:(NSString *)name;
- (void)cc_removeViewWithName:(NSString *)name;
- (id)cc_controller:(Class)aClass;
- (id)cc_controllerWithName:(NSString *)name;
- (CC_TabBarController *)cc_tabBarController;

// 调整 cc_displayView 自动滚动
- (void)cc_adaptUI;

// Trigger function, triggering after the condition of trigger function is reached
// 触发函数 条件达到后触发
- (void)cc_viewDidPopFrom:(CC_ViewController *)viewController userInfo:(id)userInfo;
- (void)cc_viewDidLoad;
- (void)cc_viewWillAppear;
- (void)cc_viewWillDisappear;
- (void)cc_didReceiveMemoryWarning;
- (void)cc_dealloc;

@end
