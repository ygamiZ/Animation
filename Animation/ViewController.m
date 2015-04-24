//
//  ViewController.m
//  Animation
//
//  Created by lanou3g on 15/4/23.
//  Copyright (c) 2015年 赵雪松. All rights reserved.
//

#import "ViewController.h"
#import "MyAnimation.h"
@interface ViewController ()

@property (strong, nonatomic) UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    _image.backgroundColor = [UIColor whiteColor];
    [_image setImage:[UIImage imageNamed:@"1.jpg"]];
    _image.userInteractionEnabled = YES;
    _image.layer.masksToBounds = YES;
    _image.layer.cornerRadius = 50;
    [self.view addSubview:_image];
    
    
//    [self.image.layer addAnimation:[MyAnimation rotation:2 degree:1 direction:1 repeatCount:MAXFLOAT] forKey:nil];
 
 
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
