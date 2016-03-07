//
//  ViewController.m
//  课后题
//
//  Created by lx on 16/1/26.
//  Copyright (c) 2016年 贝沃汇力. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {

    
    __weak IBOutlet UIView *greenView;
    UIView *_redView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _redView = [[UIView alloc] init];
    _redView.frame = CGRectMake(greenView.bounds.size.width/2, greenView.bounds.size.height/2, 50, 50);
    _redView.layer.anchorPoint = CGPointMake(0.5, 0.5);
//    _redView.layer.bounds = CGRectMake(0, 0, 50, 50);
//    _redView.layer.position = CGPointMake(greenView.bounds.size.width/2-25, greenView.bounds.size.height/2-25);
    _redView.backgroundColor = [UIColor redColor];
    
    [greenView addSubview:_redView];
    
    //绿色视图的边界裁剪
    greenView.clipsToBounds = YES;
    _redView.userInteractionEnabled = YES;
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    
        _redView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    //创建一个触摸对象
    UITouch *touch = [touches anyObject];
    
    //获取当前触摸点
    CGPoint currentPoint = [touch locationInView:greenView];
    CGPoint redPoint = [_redView convertPoint:currentPoint fromView:greenView];
    BOOL isInside =  [_redView pointInside:redPoint withEvent:nil];
//    NSLog(@"%d",isInside);
    UIView *view = touch.view;
    
    if (isInside == 1) {
       
        _redView.transform = CGAffineTransformScale(_redView.transform, 1.2, 1.2);
        
    }
   
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    
    //创建一个触摸对象
    UITouch *touch = [touches anyObject];
    
    //获取当前触摸点
    CGPoint currentPoint = [touch locationInView:greenView];
    CGPoint redPoint = [_redView convertPoint:currentPoint fromView:greenView];
    BOOL isInside =  [_redView pointInside:redPoint withEvent:nil];
    if (isInside == 1) {
        
        _redView.layer.position = currentPoint;
    }
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    _redView.transform = CGAffineTransformIdentity;
//    _redView.frame = CGRectMake(greenView.bounds.size.width/2-25, greenView.bounds.size.height/2-25, 50, 50);
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
