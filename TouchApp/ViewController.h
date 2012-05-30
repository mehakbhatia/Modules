//
//  ViewController.h
//  TouchApp
//
//  Created by Mehak on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h> 
#define kSelectedSegmentIndex 0

@interface ViewController : UIViewController
{
    IBOutlet UISegmentedControl *colorControl;
   IBOutlet UIImageView *drawImage;
    CGPoint lastTouch; // the last point that we touched
 
    UIColor *currentColor;
    BOOL mouseSwiped;
    CGFloat strokeWidth;
   
   }


@property(nonatomic)CGPoint lastTouch;
@property(nonatomic , retain) UIImageView *drawImage;
@property (nonatomic,retain)UIColor *currentColor;
@property(nonatomic)BOOL mouseSwiped;

@property(nonatomic)CGFloat strokeWidth;



@property(retain,nonatomic)IBOutlet UISegmentedControl *colorControl;

-(IBAction)changeColor:(id)sender;
@end
