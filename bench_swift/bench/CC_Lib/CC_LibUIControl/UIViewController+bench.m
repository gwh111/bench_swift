//
//  UIViewController+Bench.m
//  bench_swift
//
//  Created by gwh on 2020/12/30.
//

#import "UIViewController+bench.h"

@implementation UIViewController (bench)

//- (void)setParent:(id)parent {
//    [CC_Runtime cc_setObject:self key:@selector(parent) value:parent];
//    id parent1 = [self parent];
//    NSLog(@"%@",parent1);
//}
//
//- (id)parent {
//    id parent1 = [CC_Runtime cc_getObject:self key:@selector(parent)];
//    NSLog(@"%@",parent1);
//    return [CC_Runtime cc_getObject:self key:@selector(parent)];
//}

- (void)setupController {
    self.controller = CC_ViewController.new;
    [self.controller setupOnView:self.view];
}

- (void)setController:(CC_ViewController *)controller {
    [CC_Runtime cc_setObject:self key:@selector(controller) value:controller];
}

- (CC_ViewController *)controller {
    return [CC_Runtime cc_getObject:self key:@selector(controller)];
}

- (void)setNavigationTitle:(NSString *)title {
    self.controller.cc_title = title;
}

- (NSString *)navigationTitle {
    return self.controller.cc_title;
}

- (UIView *)displayView {
    return self.controller.cc_displayView;
}

- (void)adaptHeight {
    [self.controller cc_adaptUI];
}

- (CC_NavigationBar *)navigationBar {
    return self.controller.cc_navigationBar;
}

- (void)setNavigationBar:(CC_NavigationBar *)navigationBar {
    self.controller.cc_navigationBar = navigationBar;
}

@end
