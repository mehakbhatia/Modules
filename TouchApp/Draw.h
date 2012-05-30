//
//  Draw.h
//  TouchApp
//
//  Created by Mehak on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Draw : UIView{
    UIImage *drawImage;
    CGPoint lastTouch; // the last point that we touched
    CGPoint firstTouch; // the first point that we touched
    UIColor *currentColor;
    BOOL mouseSwiped;
    int mouseMoved;
}

@property(nonatomic)CGPoint lastTouch;
@property(nonatomic)CGPoint firstTouch;
@property(nonatomic , retain)UIImage *drawImage;
@property (nonatomic,retain)UIColor *currentColor;
@property(nonatomic)BOOL mouseSwiped;
@property(nonatomic)int mouseMoved;

@end
