//
//  ViewController.h
//  Krishna
//
//  Created by Krishna on 3/23/18.
//  Copyright © 2018 com.Krishna. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MIN_SPEED 10
#define MAX_SPEED 100

@interface ViewController : UIViewController
{
    UIButton * StartStop;
    UIView * roadView;
    BOOL isStart;
    NSTimer * raceOn;
    UIImageView * vehicle;
    CGFloat xPad;
    CGFloat yPlacement;
    double score;
    int currentSpeed;
    UIImageView * otherV1;
    UIImageView * otherV2;
}
@end

