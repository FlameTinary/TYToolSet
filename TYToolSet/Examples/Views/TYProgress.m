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
        
        [self shapeAnimationFrame:frame];
    }
    return self;
}

- (void)shapeAnimationFrame:(CGRect)frame {
    UIBezierPath * path = [self createBezierPath];
    
    _backLayer = [self createShapeLayerWithColor:[UIColor lightGrayColor] path:path];
    
    _progressLayer = [self createShapeLayerWithColor:[UIColor orangeColor] path:path];
    
}


- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    if (_progress < 0) {
        _progress = 0;
    }
    if (_progress > 1) {
        _progress = 1;
    }
    [self startBasicAnimation];
}


- (void)startBasicAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //每次动画的持续时间
    animation.duration = _duration;
    //动画起始位置
    animation.fromValue = @(_progress);
    //动画结束位置
    animation.toValue = @(0);
    //动画重复次数
    animation.repeatCount = 1;
    [_progressLayer removeAllAnimations];
    [_progressLayer addAnimation:animation forKey:@"strokeEndAnimation"];
}

/**
 生成路径

 @return path
 */
- (UIBezierPath *)createBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width/2, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    return path;
}

/**
 生成CAShapeLayer

 @param color 颜色
 @param path 路径
 @return CAShapeLayer
 */
- (CAShapeLayer *)createShapeLayerWithColor:(UIColor *)color path:(UIBezierPath *)path
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    layer.lineCap = @"round";
    //设置描边色
    layer.strokeColor = color.CGColor;
    //设置填充色
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.path = path.CGPath;
    layer.lineWidth = self.frame.size.height;
    [self.layer addSublayer:layer];
    
    return layer;
}
@end
