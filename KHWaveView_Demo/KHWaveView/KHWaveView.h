//
//  KHWaveView.h
//  waveView
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 Arron_zkh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHWaveView : UIView

/** waving time */
@property (nonatomic, assign)  NSTimeInterval waveTime;
/** wave's speed */
@property (nonatomic, assign)  CGFloat waveSpeed;
/** wave's color */
@property (nonatomic, strong)  UIColor *waveColor;


+ (instancetype)addToSuperView:(UIView *)superView WithFrame:(CGRect)frame;

- (void)wave;

- (void)stop;





@end
