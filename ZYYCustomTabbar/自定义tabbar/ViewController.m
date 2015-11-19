//
//  ViewController.m
//  自定义tabbar
//
//  Created by Hanguoxiang on 15-1-28.
//  Copyright (c) 2015年 zhangyuanyuan. All rights reserved.
//

#import "ViewController.h"
#import "CustomTabbarController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)btn:(id)sender {
    CustomTabbarController *custom = [[CustomTabbarController alloc]init];
    self.view.window.rootViewController = custom;

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//  [self.navigationController.navigationBar setBackgroundImage:[uii] forBarMetrics:<#(UIBarMetrics)#>: [UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
