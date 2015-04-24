//
//  MyAnimation.m
//  Animation
//
//  Created by lanou3g on 15/4/23.
//  Copyright (c) 2015年 赵雪松. All rights reserved.
//

#import "MyAnimation.h"

@implementation MyAnimation

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

//这句代码表示 是否动画回到原位
//[animation setAutoreverses:YES];

// 永久闪烁动画
+ (CABasicAnimation *)opacityForever_Animation:(float)time{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    
    animation.toValue = [NSNumber numberWithFloat:0.0];
    
    animation.autoreverses = YES;
    
    animation.duration = time;
    
    animation.repeatCount = FLT_MAX;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}

//有闪烁次数的动画
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    
    animation.toValue = [NSNumber numberWithFloat:0.4];
    
    animation.repeatCount = repeatTimes;
    
    animation.duration = time;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses = YES;
    
    return  animation;
    
}


// 横向移动
+(CABasicAnimation *)moveX:(float)time X:(NSInteger)x{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue = [NSNumber numberWithInteger:x];
    
    animation.duration = time;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}


//纵向移动
+(CABasicAnimation *)moveY:(float)time Y:(NSInteger)y{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    animation.toValue = [NSNumber numberWithInteger:y];
    
    animation.duration = time;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}


//缩放
+(CABasicAnimation *)scale:(NSInteger)Multiple orgin:(NSInteger)orginMultiple durTimes:(float)time Rep:(float)repeatTimes{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue = [NSNumber numberWithInteger:orginMultiple];
    
    animation.toValue = [NSNumber numberWithInteger:Multiple];
    
    animation.duration = time;
    
    animation.autoreverses = YES;
    
    animation.repeatCount = repeatTimes;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}


//组合动画
+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes{
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    
    animation.animations = animationAry;
    
    animation.duration = time;
    
    animation.repeatCount = repeatTimes;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}

/*
 CGMutablePathRef path = CGPathCreateMutable();
 //将路径的起点定位到（50  120）
 CGPathMoveToPoint(path,NULL,50.0,120.0);
 //下面5行添加5条直线的路径到path中
 CGPathAddLineToPoint(path, NULL, 60, 130);
 CGPathAddLineToPoint(path, NULL, 70, 140);
 CGPathAddLineToPoint(path, NULL, 80, 150);
 CGPathAddLineToPoint(path, NULL, 90, 160);
 CGPathAddLineToPoint(path, NULL, 100, 170);
 //下面四行添加四条曲线路径到path
 CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
 CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
 CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
 CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
*/

//路径动画
+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path = path;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses = NO;
    
    animation.duration = time;
    
    animation.repeatCount = repeatTimes;
    
    return animation;
    
}


//点移动
+(CABasicAnimation *)movepoint:(CGPoint )point{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    
    animation.toValue = [NSValue valueWithCGPoint:point];
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}


//旋转
+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount{
    
    CATransform3D rotationTransform  = CATransform3DMakeRotation(degree, 0, 0, direction);
    
    CABasicAnimation * animation;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    
    animation.duration = dur;
    
    animation.autoreverses = NO;
    
    animation.cumulative = YES;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.repeatCount = repeatCount;
    
    animation.delegate = self;
    
    return animation;
    
}

- (void) createKeyframeAnimation{
    // 路径关键帧动画
    CGMutablePathRef path = CGPathCreateMutable();
    // 起始点位置
    CGPathMoveToPoint(path, NULL, 50, 0);
    // (path, NULL, 起始点X, 起始跨度Y, 跨度X(中间点X), 跨度Y(中间点Y), 结束点X, 结束点Y)
    CGPathAddCurveToPoint(path, NULL, 50, 500.0, 150.0, 475.0, 150.0, 200.0);
    CGPathAddCurveToPoint(path,NULL,150.0,475.0,250.0,475.0,250.0,280.0);
    CGPathAddCurveToPoint(path,NULL,250.0,475.0,350.0,475.0,350.0,340.0);
    CGPathAddCurveToPoint(path,NULL,375.0,475.0,450.0,475.0,450.0,475.0);
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [anim setPath:path];
    [anim setDuration:2.0];
    [anim setAutoreverses:NO];
    [anim setRepeatCount:MAXFLOAT];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    CFRelease(path);
}






@end
