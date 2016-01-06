//
//  ViewController.m
//  图片logo水印
//
//  Created by 章芝源 on 16/1/6.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    //加载图片
    UIImage *image = [UIImage imageNamed:@"普京"];
    UIImage *imageS = [UIImage imageNamed:@"9B7538C0-1917-4F11-BD5D-A19379B715CD"];
    
    //做水印需要开启位图上下文
    //1.开启位图
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2.把图片绘制到位图上
    [image drawAtPoint:CGPointMake(0, 0)];
    
    //3. 绘制文字  &  练习富文本
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(130, 170, 40, 30);
    [self.view addSubview:label];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:100 weight:15];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSUnderlineStyleAttributeName] = @1;
    dict[NSUnderlineColorAttributeName] = [UIColor orangeColor];
//    label.attributedText = [[NSAttributedString alloc]initWithString:@"come on!!!!!!" attributes:dict];
    
    NSString *str = @"come on!!!!!!!";

    [str drawAtPoint:CGPointMake(0, 50) withAttributes:dict];
    [imageS drawInRect:CGRectMake(0, 200, 100, 100) blendMode:kCGBlendModeNormal alpha:0.5];
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    //关闭
    UIGraphicsEndImageContext();
    
    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 50, 300, 300);
    imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.image = image;
    [self.view addSubview:imageView];

}

@end
