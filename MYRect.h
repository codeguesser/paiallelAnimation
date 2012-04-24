//
//  MYRect.h
//  testPuzule
//
//  Created by  on 2012/4/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYRect : NSObject{
    float width;
    float height;
    float x;
    float y;
    float z;
    float degree;
}
@property(nonatomic,assign) float width;
@property(nonatomic,assign)float height;
@property(nonatomic,assign)float x;
@property(nonatomic,assign)float y;
@property(nonatomic,assign)float degree;
@property(nonatomic,assign)float z;
-(id)initWithWidth:(float)_width height:(float)_height X:(float)_x Y:(float)_y Z:(float)_z degree:(float)_degree;
+(id)DataWithWidth:(float)_width height:(float)_height X:(float)_x Y:(float)_y Z:(float)_z degree:(float)_degree;
-(id)initWithMyrect:(MYRect *)_myrect;
@end
