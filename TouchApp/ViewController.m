//
//  ViewController.m
//  TouchApp
//
//  Created by Mehak on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h> 



@interface ViewController ()

@end

@implementation ViewController
@synthesize colorControl;
@synthesize lastTouch;
@synthesize currentColor;
@synthesize drawImage;
@synthesize mouseSwiped;

@synthesize strokeWidth;



-(void)changeColor:(id)sender{
   
    if([sender selectedSegmentIndex] != kSelectedSegmentIndex)// red color selected
    {
        currentColor = [UIColor blackColor]; // set color to black
        strokeWidth = 30.0;
    }
    else {
        currentColor = [UIColor redColor]; // set color to red
        strokeWidth = 5.0;
    }
 
    
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    drawImage = [[UIImageView alloc] initWithImage:nil];
    drawImage.frame= self.view.frame;
    [self.view addSubview:drawImage];

    
    
}

- (void)viewDidUnload
{
    self.colorControl = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    
    if ([touch tapCount] == 2) {
        drawImage.image = nil;
        return;
    }
    
    lastTouch = [touch locationInView:self.view];
    lastTouch.y -= 20; // covers the size of the finger n starts from the middle
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped = YES;
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    currentPoint.y -= 20;
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
 //   CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), strokeWidth);
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), currentColor.CGColor);
 //   CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastTouch.x, lastTouch.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    lastTouch = currentPoint;
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    if ([touch tapCount] == 2) {
        drawImage.image = nil;
        return;
    }
    
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
      //  CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), strokeWidth);
        CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), currentColor.CGColor);
    //    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastTouch.x, lastTouch.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastTouch.x, lastTouch.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}

@end
