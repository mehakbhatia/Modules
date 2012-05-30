//
//  Draw.m
//  TouchApp
//
//  Created by Mehak on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Draw.h"

@implementation Draw
@synthesize lastTouch;
@synthesize currentColor;
@synthesize firstTouch;
@synthesize drawImage;
@synthesize mouseSwiped;
@synthesize mouseMoved;

-(id)initWithCoder:(NSCoder *)coder{
    if(self=[super initWithCoder:coder]){
        currentColor = [[UIColor redColor] retain];
        if(drawImage == nil){
            drawImage = [[UIImage imageNamed:@"iphone.png"]retain];
        }
    
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    {
    if(mouseSwiped)
    //CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIGraphicsBeginImageContext(self.frame.size);
    [drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    }
    

    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    
  /*  if ([touch tapCount] == 2) {
        drawImage.image = nil;
        return;
    }*/
    
    lastTouch = [touch locationInView:self];
    lastTouch.y -= 20;
    [self setNeedsDisplay];
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped = YES;
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    currentPoint.y -= 20;
    [self setNeedsDisplay];
      lastTouch = currentPoint;
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
    
  /*  if ([touch tapCount] == 2) {
        drawImage.image = nil;
        return;
    }*/
    
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.frame.size);
        [drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}



@end
