//
//  InstagramActivityIndicator.m
//  InstagramActivityIndicator
//
//  Created by Yahya on 03/04/17.
//  Copyright © 2017 yahya. All rights reserved.
//

#import "InstagramActivityIndicator.h"

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@implementation InstagramActivityIndicator

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
        [self setup];
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder])
        [self setup];
    return self;
}

-(void)setup{
    // create and add the replicator layer
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer new];
    [self.layer addSublayer:replicatorLayer];
    
    // configure the shape layer that gets replicated
    CAShapeLayer *dot = [CAShapeLayer new];
    dot.lineCap = kCALineCapRound;
    dot.strokeColor = _strokeColor.CGColor;
    dot.lineWidth = _lineWidth;
    dot.fillColor = nil;
    [replicatorLayer addSublayer:dot];
    
    self.replicatorLayer = replicatorLayer;
    self.segmentLayer = dot;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    double maxSize = MAX(0, MIN(self.bounds.size.width, self.bounds.size.height));
    _replicatorLayer.bounds = CGRectMake(0, 0, maxSize, maxSize);
    _replicatorLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height / 2);
    
    [self updateSegments];
}

-(void)updateSegments{
    if(_numSegments > 0){
        
        CGFloat angle = 2*M_PI / _numSegments;
        _replicatorLayer.instanceCount = _numSegments;
        _replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
        _replicatorLayer.instanceDelay = 1.5 * _animationDuration/_numSegments;
        
        double maxRadius = MAX(0, MIN(_replicatorLayer.bounds.size.width, _replicatorLayer.bounds.size.height))/2;
        CGFloat radius = maxRadius - _lineWidth/2;
        
        _segmentLayer.bounds = CGRectMake(0, 0, 2*maxRadius, 2*maxRadius);
        _segmentLayer.position = CGPointMake(_replicatorLayer.bounds.size.width/2, _replicatorLayer.bounds.size.height/2);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(maxRadius, maxRadius) radius:radius startAngle:-angle/2 - M_PI/2 endAngle:angle/2 - M_PI/2 clockwise:YES];
        _segmentLayer.path = path.CGPath;

    }
}

/// Starts the animation of the indicator.
-(void)startAnimating{
    self.hidden = NO;
    _isAnimating = YES;
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.byValue = [NSNumber numberWithFloat:(M_PI * 2)];
    rotate.duration = _rotationDuration;
    rotate.repeatCount = INFINITY;
    
    
    // add animations to segment
    // multiplying duration changes the time of empty or hidden segments
    CABasicAnimation *shrinkStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    shrinkStart.fromValue = [NSNumber numberWithFloat:0.0];
    shrinkStart.toValue = [NSNumber numberWithFloat:0.5];
    shrinkStart.duration = _animationDuration; // * 1.5
    shrinkStart.autoreverses = YES;
    shrinkStart.repeatCount = INFINITY;
    shrinkStart.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    CABasicAnimation *shrinkEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    shrinkEnd.fromValue = [NSNumber numberWithFloat:1.0];
    shrinkEnd.toValue = [NSNumber numberWithFloat:0.5];
    shrinkEnd.duration = _animationDuration; // * 1.5
    shrinkEnd.autoreverses = YES;
    shrinkEnd.repeatCount = INFINITY;
    shrinkEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    CABasicAnimation *fade = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    fade.fromValue = [NSNumber numberWithFloat:_lineWidth];
    fade.toValue = [NSNumber numberWithFloat:0.0];
    fade.duration = _animationDuration; // * 1.5
    fade.autoreverses = YES;
    fade.repeatCount = INFINITY;
    fade.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.55 :0.0 :0.45 :10];
    
    [_replicatorLayer addAnimation:rotate forKey: @"rotate"];
    [_segmentLayer addAnimation:shrinkStart forKey: @"start"];
    [_segmentLayer addAnimation:shrinkEnd forKey: @"end"];
    [_segmentLayer addAnimation:fade forKey: @"fade"];
}

/// Stops the animation of the indicator.
-(void)stopAnimating{
    _isAnimating = NO;
    
    [_replicatorLayer removeAnimationForKey:@"rotate"];
    [_segmentLayer removeAnimationForKey:@"start"];
    [_segmentLayer removeAnimationForKey:@"end"];
    [_segmentLayer removeAnimationForKey:@"fade"];
    
    if (_hidesWhenStopped) {
        self.hidden = YES;
    }
}

//SETTERS

-(void)setNumSegments:(int)numSegments{
    _numSegments = numSegments;
    [self updateSegments];
}

-(void)setStrokeColor:(UIColor *)strokeColor{
    _strokeColor = strokeColor;
    _segmentLayer.strokeColor = strokeColor.CGColor;
}

-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    _segmentLayer.lineWidth = lineWidth;
    [self updateSegments];
}

@end
