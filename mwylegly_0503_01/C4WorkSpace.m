//
//  C4WorkSpace.m
//  mwylegly_0503_01
//
//  Created by MADT.Student on 12-05-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "C4WorkSpace.h"

@implementation C4WorkSpace{
    
    int pointCount;
    CGPoint pointList[7];
    C4Shape *elPoints;
    float xPointValue, yPointValue;
    int pointOriginWidth, pointOriginHeight;
    
    C4Shape *lineTest;
    
}

-(void)setup {
    pointCount = 7;
    
    for (int i = 0; i < pointCount; i++) {
        
        pointOriginWidth = [C4Math randomIntBetweenA:(i*2 + [C4Math randomInt:100]) andB:(self.canvas.frame.size.width - (i*2 + [C4Math randomInt:100]))];
        
        pointOriginHeight = [C4Math randomIntBetweenA:(i + [C4Math randomInt:100]) andB:(self.canvas.frame.size.width - (i*2 + [C4Math randomInt:100]))];
        
        pointList[i] = CGPointMake(pointOriginWidth, pointOriginHeight); 
        //C4Log(@"%4.2f,%4.2f", pointList[i]);
        
        xPointValue = pointList[i].x;
        yPointValue = pointList[i].y;
        //C4Log(@"%4.2f,%4.2f", xPointValue, yPointValue);
                
        elPoints = [C4Shape ellipse:CGRectMake(pointOriginWidth, pointOriginHeight, 1, 1)];
        elPoints.lineWidth = .75f;
        elPoints.fillColor = [UIColor clearColor];
        elPoints.strokeColor = [UIColor blackColor];
        
        [self.canvas addShape:elPoints];
    }
    //C4Log(@"%4.2f,%4.2f", pointList[]);
    
    for (int index = 0; index < pointCount; index++) {
        for (int index2 = 0; index2 < pointCount; index2 ++) {
            
            CGPoint linePoints[2] = {
                CGPointMake(pointList[index].x, pointList[index].y),
                CGPointMake(pointList[index2].x, pointList[index2].y)
            };
            
            C4Shape *webbing = [C4Shape line:linePoints];
            webbing.lineWidth = 2.5f;
            webbing.strokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:.05];
            [self.canvas addShape:webbing];
        }
    }
    
    //C4Log(@"%4.2f,%4.2f", xPointValue, yPointValue);

    
}


@end
