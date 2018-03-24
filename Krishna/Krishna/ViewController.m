//
//  ViewController.m
//  Krishna
//
//  Created by Krishna on 3/23/18.
//  Copyright © 2018 com.Krishna. All rights reserved.
//

#import "ViewController.h"

char * vehicles[] ={
    "Bike1.png",
    "Bike2.png",
    "DeliveryBoy.png",
    "SportsCar.png",
    "YellowCar.png",
};

int vehiclesCount = sizeof(vehicles)/sizeof(char *);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.52 green:0.76 blue:0.33 alpha:1.0];
    
    roadView = [[UIView alloc]init];
    roadView.backgroundColor = [UIColor colorWithRed:0.15 green:0.28 blue:0.31 alpha:1.0];
    [self.view addSubview:roadView];
    
    int v = [self randomIntValue:vehiclesCount];
    if(v<0) v*=-1;
    NSString * str = [NSString stringWithUTF8String:vehicles[v]];
    
    vehicle = [[UIImageView alloc]init];
    vehicle.backgroundColor = [UIColor clearColor];
    vehicle.image = [UIImage imageNamed:str];
    vehicle.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:vehicle];
    
    v = [self randomIntValue:vehiclesCount];
    if(v<0) v*=-1;
    str = [NSString stringWithUTF8String:vehicles[v]];
    
    otherV1 = [[UIImageView alloc]init];
    otherV1.backgroundColor = [UIColor clearColor];
    otherV1.image = [UIImage imageNamed:str];
    otherV1.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:otherV1];
    
    v = [self randomIntValue:vehiclesCount];
    if(v<0) v*=-1;
    str = [NSString stringWithUTF8String:vehicles[v]];
    
    otherV2 = [[UIImageView alloc]init];
    otherV2.backgroundColor = [UIColor clearColor];
    otherV2.image = [UIImage imageNamed:str];
    otherV2.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:otherV2];
    
    StartStop = [UIButton buttonWithType:UIButtonTypeCustom];
    [StartStop setTitle:@"Start" forState:UIControlStateNormal];
    [StartStop setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:StartStop];
    StartStop.showsTouchWhenHighlighted = YES;
    [StartStop addTarget:self action:@selector(startRace:) forControlEvents:UIControlEventTouchUpInside];
    isStart = NO;
    
    [self setFrames];
    xPad = 0.0;
}

- (void) setFrames
{
    CGRect rect = self.view.frame;
    StartStop.frame = CGRectMake(rect.size.width/3, rect.size.height-150, rect.size.width/3, rect.size.height/15);
    roadView.frame = CGRectMake(0, rect.size.height/10, rect.size.width, rect.size.height - (rect.size.height/5));
    yPlacement = (roadView.frame.size.height - 14)/3;
    vehicle.frame = CGRectMake( (rect.size.width/2)-40, yPlacement-25, 80, 50);
    otherV1.frame = CGRectMake( (rect.size.width/2)-40, (yPlacement*2)-25, 80, 50);
    otherV2.frame = CGRectMake( (rect.size.width/2)-40, (yPlacement*3)-25, 80, 50);
    [self drawLines];
    [self addTrees];
}

- (void) drawLines
{
    UILabel * topBorder =  [[UILabel alloc]init];
    topBorder.backgroundColor = [UIColor orangeColor];
    [roadView addSubview:topBorder];
    topBorder.frame = CGRectMake(0, 2, roadView.frame.size.width, 5);
    
//    UILabel * lane1 =  [[UILabel alloc]init];
//    lane1.backgroundColor = [UIColor clearColor];
//    [roadView addSubview:lane1];
//    lane1.frame = CGRectMake(0, 50, roadView.frame.size.width, 50);
//    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc]initWithString:@"" attributes:@{NSUnderlineStyleAttributeName: @(NSUnderlinePatternDash),NSUnderlineColorAttributeName: [UIColor whiteColor],}];
//
//    UILabel * lane2 =  [[UILabel alloc]init];
//    lane2.backgroundColor = [UIColor clearColor];
//    [roadView addSubview:lane2];
//    lane2.frame = CGRectMake(0, 100, roadView.frame.size.width, 50);
//
//    UILabel * lane3 =  [[UILabel alloc]init];
//    lane3.backgroundColor = [UIColor clearColor];
//    [roadView addSubview:lane3];
//    lane3.frame = CGRectMake(0, 150, roadView.frame.size.width, 50);
//
//    lane1.attributedText = attrStr;
//    lane2.attributedText = attrStr;
//    lane3.attributedText = attrStr;
    
    UILabel * bottomBorder =  [[UILabel alloc]init];
    bottomBorder.backgroundColor = [UIColor orangeColor];
    [roadView addSubview:bottomBorder];
    bottomBorder.frame = CGRectMake(0, roadView.frame.size.height-7, roadView.frame.size.width, 5);
}

- (void) addTrees
{
    [self topTrees];
    [self bottomTrees];
}

- (void) topTrees
{
    CGFloat wid = self.view.frame.size.width/15;
    CGFloat heg = self.view.frame.size.height/10;
    CGFloat x = 0.0;
    for (int i = 1; i<=15; i++) {
        UIImageView * treeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Tree1.png"]];
        [self.view addSubview:treeView];
        treeView.frame = CGRectMake( x, 0, wid, heg);
        x+=wid;
    }
}

- (void) bottomTrees
{
    CGFloat wid = self.view.frame.size.width/15;
    CGFloat heg = self.view.frame.size.height/10;
    CGFloat y = self.view.frame.size.height-(self.view.frame.size.height/10);
    CGFloat x = 0.0;
    for (int i = 1; i<=15; i++) {
        UIImageView * treeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Tree2.png"]];
        [self.view addSubview:treeView];
        treeView.frame = CGRectMake( x, y, wid, heg);
        x+=wid;
    }
}

- (void) startRace:(id)sender
{
    if(isStart)
    {
        isStart = NO;
        [StartStop setTitle:@"Start" forState:UIControlStateNormal];
        [self setFrames];
        [raceOn invalidate];
        raceOn = nil;
    }
    else
    {
        isStart = YES;
        currentSpeed = 5;
        [StartStop setTitle:@"Stop" forState:UIControlStateNormal];
        score = 0;
        raceOn = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(running) userInfo:nil repeats:YES];
        StartStop.hidden = YES;
    }
}

- (void) running
{
//    @synchronized(self){
        [self moveVehicleForward:vehicle];
        [self moveVehicleForward:otherV1];
        [self moveVehicleForward:otherV2];
//    }
}

- (void) changeVehicle:(UIImageView *)imgView
{
    int v = [self randomIntValue:vehiclesCount];
    if(v<0) v*=-1;
    NSString * str = [NSString stringWithUTF8String:vehicles[v]];
    imgView.image =[UIImage imageNamed:str];
}

- (void) moveVehicleForward:(UIImageView *)imgView
{
//    CGFloat yPad = imgView.frame.origin.y;
    if(xPad>self.view.frame.size.width)
    {
        [self changeVehicle:imgView];
//        int y = [self randomIntValue:3];
//        if(y==1) yPad = 50;
//        else if(y==2) yPad = 150;
//        else yPad = 250;
        xPad = 10;
    }
    else
    {
        xPad+=currentSpeed;
    }
    imgView.frame = CGRectMake(xPad, imgView.frame.origin.y, 80, 50);
}

- (int) randomIntValue:(int)max
{
    return (int)arc4random()%max;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
