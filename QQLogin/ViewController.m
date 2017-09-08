//
//  ViewController.m
//  QQLogin
//
//  Created by MJ on 2017/9/8.
//  Copyright © 2017年 韩明静. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIBezierPath *path2;

@property(nonatomic,strong)CAShapeLayer *layer2;

@property(nonatomic,strong)NSTimer *timer;

@property(nonatomic,assign)CGFloat start;

@end

@implementation ViewController

-(NSTimer *)timer{
    
    if (_timer==nil) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    }
    return _timer;
}

-(void)timerAction{
    
    if ([self.view.layer.sublayers containsObject:self.layer2]) {
        
        [self.layer2 removeFromSuperlayer];
    }
    
    self.path2=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, self.view.center.y) radius:85 startAngle:M_PI/2+M_PI/4*self.start endAngle:M_PI/2+M_PI+M_PI/4*self.start clockwise:YES];
    self.layer2=[CAShapeLayer layer];
    self.layer2.path=self.path2.CGPath;
    self.layer2.strokeColor=[UIColor blueColor].CGColor;
    self.layer2.fillColor=nil;
    [self.view.layer insertSublayer:self.layer2 atIndex:0];

    self.start=self.start+1;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.start=0;
    
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, self.view.center.y) radius:80 startAngle:0 endAngle:2*M_PI clockwise:YES];
    CAShapeLayer *layer=[CAShapeLayer layer];
    layer.path=path.CGPath;
    layer.strokeColor=[UIColor lightGrayColor].CGColor;
    layer.fillColor=nil;
    [self.view.layer addSublayer:layer];
    
    UIBezierPath *path1=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, self.view.center.y+80) radius:10 startAngle:0 endAngle:2*M_PI clockwise:YES];
    CAShapeLayer *layer1=[CAShapeLayer layer];
    layer1.path=path1.CGPath;
    layer1.strokeColor=[UIColor greenColor].CGColor;
    layer1.fillColor=[UIColor greenColor].CGColor;

    [self.view.layer addSublayer:layer1];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.timer fire];
}


@end
