//
//  MyAnimation.h
//  Animation
//
//  Created by lanou3g on 15/4/23.
//  Copyright (c) 2015年 赵雪松. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAnimation : UIView
//永久闪烁的动画
+ (CABasicAnimation *)opacityForever_Animation:(float)time;
//有闪烁次数的动画
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;
//横向移动
+(CABasicAnimation *)moveX:(float)time X:(NSInteger)x;
//纵向移动
+(CABasicAnimation *)moveY:(float)time Y:(NSInteger)y;
//缩放
+(CABasicAnimation *)scale:(NSInteger)Multiple orgin:(NSInteger)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;
//组合动画
+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes;
//路径动画
+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes;
 //点移动
+(CABasicAnimation *)movepoint:(CGPoint )point;
//旋转
+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount;







@end
