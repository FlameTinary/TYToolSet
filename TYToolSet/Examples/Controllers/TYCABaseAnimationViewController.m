//
//  TYCABaseAnimationViewController.m
//  TYToolSet
//
//  Created by user001 on 2018/9/30.
//  Copyright © 2018年 Sheldon. All rights reserved.
//

#import "TYCABaseAnimationViewController.h"
#import "TYHeartView.h"
#import "TYProgress.h"

@interface TYCABaseAnimationViewController ()

@end

@implementation TYCABaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"CABaseAnimation";
    
    [self animationForHeart];
    
    TYProgress *progress = [[TYProgress alloc] initWithFrame:CGRectMake(50, 100, 200, 10)];
    [self.view addSubview:progress];
    
}

- (void)animationForHeart {
    TYHeartView *heartView = [[TYHeartView alloc] init];
    heartView.frame = CGRectMake(100, 200, 200, 200);
    [self.view addSubview:heartView];
    
    // 给心视图添加心跳动画
    float bigSize = 1.1;
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = 0.25;
    pulseAnimation.toValue = [NSNumber numberWithFloat:bigSize];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // 倒转动画
    pulseAnimation.autoreverses = YES;
    // 设置重复次数为无限大
    pulseAnimation.repeatCount = FLT_MAX;
    // 添加动画到layer
    [heartView.layer addAnimation:pulseAnimation forKey:@"transform.scale"];
}

@end
