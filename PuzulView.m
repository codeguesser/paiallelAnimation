//
//  PuzulView.m
//  testPuzule
//
//  Created by  on 2012/4/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PuzulView.h"

@implementation PuzulView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame image:(UIImage *)_image fromRect:(MYRect *)_fromRect toRect:(MYRect *)_toRect
{
    self = [super initWithFrame:frame];
    if (self) {
        tapCount = 0;
        image  = [[UIImage alloc]initWithCGImage:_image.CGImage];
        fromRect = [[MYRect alloc]initWithMyrect:_fromRect];
        toRect = [[MYRect alloc]initWithMyrect:_toRect];
        
        
        partLayer = [[CALayer alloc]init];
        
        [partLayer setContents:(id)image.CGImage];
        [partLayer setBounds:CGRectMake(0, 0,fromRect.width, fromRect.height)];
        [partLayer setPosition:CGPointMake(fromRect.x, fromRect.y)];
        CATransform3D trans = CATransform3DMakeRotation(fromRect.degree, 0, 0, 1);
        [partLayer setTransform:trans];
        [partLayer setZPosition:100.0];
        [self.layer addSublayer:partLayer];
        
        [self addTarget:self action:@selector(goAPlace) forControlEvents:UIControlEventTouchUpInside];
        
        
        NSLog(@"%f,%f",partLayer.frame.size.width,partLayer.frame.size.height);
    }
    return self;
}


-(void)goAPlace{
    
    
    if (tapCount==0) {
        [partLayer addAnimation:[self AnimationRotation] forKey:@"Rotation"];
        [partLayer addAnimation:[self AnimationX] forKey:@"translationX"];
        [partLayer addAnimation:[self AnimationY] forKey:@"translationY"];
        tapCount++;
    }
    
    
    
    
    
}

-(CABasicAnimation *)AnimationRotation{
    CABasicAnimation *theAnimationRotation;
    
    theAnimationRotation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    theAnimationRotation.duration=3.0;
    theAnimationRotation.repeatCount=1;
    theAnimationRotation.autoreverses=NO;   //是否设置回放
    theAnimationRotation.removedOnCompletion = NO;  //是否删除动画，也就是回到原来的地方
    theAnimationRotation.fillMode = kCAFillModeForwards; //旋转之后保持的状态
    theAnimationRotation.fromValue=[NSNumber numberWithFloat:fromRect.degree];
    theAnimationRotation.toValue=[NSNumber numberWithFloat:toRect.degree];
    [theAnimationRotation setDelegate:self];
    
    return theAnimationRotation;
}

-(CABasicAnimation *)AnimationX{
    CABasicAnimation *theAnimationX;
    
    theAnimationX=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    theAnimationX.duration=3.0;
    theAnimationX.repeatCount=1;
    theAnimationX.autoreverses=NO;   //是否设置回放
    theAnimationX.removedOnCompletion = NO;  //是否删除动画，也就是回到原来的地方
    theAnimationX.fillMode = kCAFillModeForwards; //旋转之后保持的状态
    theAnimationX.fromValue=[NSNumber numberWithFloat:0];
    theAnimationX.toValue=[NSNumber numberWithFloat:toRect.x];
    theAnimationX.delegate = nil;
    return theAnimationX;
}

-(CABasicAnimation *)AnimationY{
    CABasicAnimation *theAnimationY;
    
    theAnimationY=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    theAnimationY.duration=3.0;
    theAnimationY.repeatCount=1;
    theAnimationY.autoreverses=NO;   //是否设置回放
    theAnimationY.removedOnCompletion = NO;  //是否删除动画，也就是回到原来的地方
    theAnimationY.fillMode = kCAFillModeForwards; //旋转之后保持的状态
    theAnimationY.fromValue=[NSNumber numberWithFloat:0];
    theAnimationY.toValue=[NSNumber numberWithFloat:toRect.y];
    theAnimationY.delegate = nil;
    
    return theAnimationY;
}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self setUserInteractionEnabled:YES];
    [delegate animationEnd];
}
-(void)animationDidStart:(CAAnimation *)anim{
    [self setUserInteractionEnabled:NO];
    
}
@end
