//
//  InstagramActivityIndicator.h
//  InstagramActivityIndicator
//
//  Created by Yahya on 03/04/17.
//  Copyright © 2017 yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

IB_DESIGNABLE
@interface InstagramActivityIndicator : UIView


/// Specifies the segment animation duration.
@property (nonatomic) IBInspectable double animationDuration;


/// Specifies the indicator rotation animatino duration.
@property (nonatomic) IBInspectable double rotationDuration;


/// Specifies the number of segments in the indicator.
@property (nonatomic) IBInspectable int numSegments;


/// Specifies the stroke color of the indicator segments.
@property (nonatomic, retain) IBInspectable UIColor *strokeColor;


/// Specifies the line width of the indicator segments.
@property (nonatomic) IBInspectable CGFloat lineWidth;


/// A Boolean value that controls whether the receiver is hidden when the animation is stopped.
@property (nonatomic) IBInspectable BOOL hidesWhenStopped;


/// A Boolean value that returns whether the indicator is animating or not.
@property (nonatomic, readonly) BOOL isAnimating;


/// the layer replicating the segments.
@property (weak) CAReplicatorLayer *replicatorLayer;


/// the visual layer that gets replicated around the indicator.
@property (weak) CAShapeLayer *segmentLayer;


/// Starts the animation of the indicator.
-(void)startAnimating;


/// Stops the animation of the indicator.
-(void)stopAnimating;


@end
