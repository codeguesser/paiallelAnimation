//
//  PuzulView.h
//  testPuzule
//
//  Created by  on 2012/4/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


@protocol MYPuzulProtocol <NSObject>

-(void)animationEnd;

@end




#import <UIKit/UIKit.h>
#import "MYRect.h"
#import <QuartzCore/QuartzCore.h>
@interface PuzulView : UIButton{
    UIImage *image;
    MYRect *fromRect;
    MYRect *toRect;
    CALayer *partLayer;
    int tapCount;
    id<MYPuzulProtocol>delegate;
    
}
@property(assign,nonatomic)id<MYPuzulProtocol>delegate;
- (id)initWithFrame:(CGRect)frame image:(UIImage *)_image fromRect:(MYRect *)_fromRect toRect:(MYRect *)_toRect;
-(void)goAPlace;
-(CABasicAnimation *)AnimationRotation;
-(CABasicAnimation *)AnimationX;
-(CABasicAnimation *)AnimationY;
@end
