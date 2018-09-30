//
//  TYProgress.m
//  TYToolSet
//
//  Created by user001 on 2018/9/30.
//  Copyright © 2018年 Sheldon. All rights reserved.
//

#import "TYProgress.h"

@interface TYProgress()
@property (nonatomic, strong) CAShapeLayer *backLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@end

@implementation TYProgress
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor lightGrayColor];
//        self.layer.cornerRadius = frame.size.height/2;
//        self.layer.masksToBounds = YES;
        [self shapeAnimationFrame:frame];
    }
    return self;
}

- (void)shapeAnimationFrame:(CGRect)frame {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(frame.size.width/2, 0)];
    [path addLineToPoint:CGPointMake(frame.size.width, 0)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //每次动画的持续时间
    animation.duration = 5;
    //动画起始位置
    animation.fromValue = @(1);
    //动画结束位置
    animation.toValue = @(0);
    //动画重复次数
    animation.repeatCount = 100;
    
    CAShapeLayer *bglayer = [self createBackShape:[UIColor lightGrayColor]];
    bglayer.path = path.CGPath;
    bglayer.lineWidth = frame.size.height;
    
    CAShapeLayer *layer = [self createShapeLayerNoFrame:[UIColor orangeColor]];
    layer.path = path.CGPath;
    layer.lineWidth = frame.size.height;
    //设置图形的弧度
    //    layer.strokeStart = 0;
    //    layer.strokeEnd = 0;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
    //注：由于UIBezierPath已经设置路径，所以动画的路径就不需要再次设置，只需要设置起始0与结束1就行，有需要可以设置动画结束后是否需要返回原位置。
}

- (CAShapeLayer *)createBackShape:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    //设置描边色
    layer.strokeColor = color.CGColor;
    layer.lineCap = @"round";
    //设置填充色
    layer.fillColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:layer];
    return layer;
}

- (CAShapeLayer *)createShapeLayerNoFrame:(UIColor *)color
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    layer.lineCap = @"round";
    //设置描边色
    layer.strokeColor = color.CGColor;
    //设置填充色
    layer.fillColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:layer];
    
    return layer;
}
@end
