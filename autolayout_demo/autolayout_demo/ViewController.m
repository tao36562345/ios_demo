//
//  ViewController.m
//  autolayout_demo
//
//  Created by shengzhong on 15/5/22.
//  Copyright (c) 2015年 shengzhong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIButton *btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"mgen" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 居中
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:btn
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view attribute:NSLayoutAttributeCenterX
                              multiplier:1 constant:0]];
    
    // 距离底部20单位
    // 注意NSLayoutConstraint创建的constant是加在toltem参数的，所以需要-20。
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:btn
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1
                              constant:-20]];
    
    // 定义高度是父view的三分之一
    NSLayoutConstraint *con = [NSLayoutConstraint
                               constraintWithItem:btn attribute:NSLayoutAttributeHeight
                               relatedBy:NSLayoutRelationEqual
                               toItem:self.view attribute:NSLayoutAttributeHeight
                               multiplier:0.3 constant:0];
    con.priority = UILayoutPriorityDefaultHigh;
    [self.view addConstraint:con];
    
    // 注册KVO方法
    [btn addObserver:self forKeyPath:@"bounds"
             options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial
             context:nil];
    
    // 设置btn的最小高度为150
    [btn addConstraint:[NSLayoutConstraint
                        constraintWithItem:btn attribute:NSLayoutAttributeHeight
                        relatedBy:NSLayoutRelationGreaterThanOrEqual
                        toItem:nil attribute:NSLayoutAttributeNotAnAttribute
                        multiplier:1 constant:150]];
    
}

// KVO回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == btn && [keyPath isEqualToString:@"bounds"]) {
        [btn setTitle:NSStringFromCGSize(btn.bounds.size) forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
