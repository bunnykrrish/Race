//
//  ViewController.h
//  Krishna
//
//  Created by Krishna on 3/23/18.
//  Copyright © 2018 com.Krishna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIButton * StartStop;
    UIView * roadView;
    BOOL isStart;
    NSTimer * raceOn;
    UIImageView * vehicle;
    CGFloat xPad;
    double score;
}
@end

