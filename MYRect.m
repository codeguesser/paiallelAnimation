//
//  MYRect.m
//  testPuzule
//
//  Created by  on 2012/4/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MYRect.h"

@implementation MYRect
@synthesize width,height,x,y,degree,z;



-(id)initWithWidth:(float)_width height:(float)_height X:(float)_x Y:(float)_y Z:(float)_z degree:(float)_degree{
    self = [super init];
    if (self) {
        width = _width;
        height =_height;
        x = _x;
        y = _y;
        z = _z;
        degree = _degree;
    }
    return self;
}

+(id)DataWithWidth:(float)_width height:(float)_height X:(float)_x Y:(float)_y Z:(float)_z degree:(float)_degree{
    return [[[self alloc]initWithWidth:_width height:_height X:_x Y:_y Z:_z degree:_degree]autorelease];
}



-(NSString *)description{
    return [NSString stringWithFormat:@"x:%f,\ny:%f,\nheight:%f,\nwidth:%f,\nz:%f,\ndegree:%f\n",x,y,height,width,z,degree];
}


-(id)initWithMyrect:(MYRect *)_myrect{
    self = [super init];
    if (self) {
        width = _myrect.width;
        height =_myrect.height;
        x = _myrect.x;
        y = _myrect.y;
        z = _myrect.z;
        degree = _myrect.degree;
    }
    return self;
}
@end
