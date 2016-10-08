//
//  KHWaveView.m
//  waveView
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 Arron_zkh. All rights reserved.
//

#import "KHWaveView.h"

@interface KHWaveView ()
/** displayLink */
@property (nonatomic, strong)  CADisplayLink *displayLink;
/** shapeLayer */
@property (nonatomic, strong)  CAShapeLayer *shapeLayer;
/** angularSpeed */
@property (nonatomic, assign)  CGFloat angularSpeed;
/** waveOffset */
@property (nonatomic, assign)  CGFloat waveOffset;

@end

@implementation KHWaveView

#pragma mark - lazy load
- (CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = self.waveColor.CGColor;
        [self.layer addSublayer:_shapeLayer];
    }
    return _shapeLayer;
}

- (CADisplayLink *)displayLink{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleWave)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _displayLink;
}

#pragma mark - Initailization
+ (instancetype)addToSuperView:(UIView *)superView WithFrame:(CGRect)frame{
    KHWaveView *waveview = [[KHWaveView alloc]initWithFrame:frame];
    [superView addSubview:waveview];
    return waveview;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
    _waveTime = 2.f;
    _waveColor = [UIColor whiteColor];
    _waveSpeed = 10.f;
    _angularSpeed = 1.f;
    _waveOffset = 1.f;
}


#pragma mark - start waving
- (void)wave{
    
    [self displayLink];
    
    if (self.waveTime) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.waveTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self stop];
        });
    }
}

- (void)handleWave{
    
    self.waveOffset += self.waveSpeed;
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, height / 2);

    CGFloat y = 0.f;
    for (CGFloat x = 0; x <= width; x++) {
        y = height * sin(0.01 * (self.angularSpeed * x + self.waveOffset));
        CGPathAddLineToPoint(path, NULL, x, y);
    }
    
    CGPathAddLineToPoint(path, NULL, width, height);
    CGPathAddLineToPoint(path, NULL, 0, height);
    CGPathCloseSubpath(path);
    self.shapeLayer.path = path;
    
    CGPathRelease(path);
}

#pragma mark - stop waving
- (void)stop{
   [UIView animateWithDuration:1.5f animations:^{
       self.alpha = 0.f;
   } completion:^(BOOL finished) {
       [self.displayLink invalidate];
       self.displayLink = nil;
       self.shapeLayer.path = nil;
       self.alpha = 1.f;
   }];
}



@end
