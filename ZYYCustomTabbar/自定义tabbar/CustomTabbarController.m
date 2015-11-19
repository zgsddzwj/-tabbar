//
//  CustomTabbarController.m
//  自定义tabbar
//
//  Created by Hanguoxiang on 15-1-28.
//  Copyright (c) 2015年 zhangyuanyuan. All rights reserved.
//

#import "CustomTabbarController.h"
#define EACH_W(A) ([UIScreen mainScreen].bounds.size.width/A)
#define EACH_H (self.tabBar.bounds.size.height)
#define BTNTAG 10000
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
@interface CustomTabbarController ()

@end

@implementation CustomTabbarController
{
    UIButton *_button;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
            }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    [self initControllers];
    [self creatTabbar:self.viewControllers.count];
    [self initControllers];
}
#pragma mark - 如果想添加控制器到tabbar里面在这里面实例化就行
- (void)initControllers
{
    ViewController1 *view1 = [[ViewController1 alloc]init];
    [self addViewControllers:view1 title:@"view1"];
    
    ViewController2 *view2 = [[ViewController2 alloc]init];
    [self addViewControllers:view2 title:@"view2"];

    ViewController3 *view3 = [[ViewController3 alloc]init];
    [self addViewControllers:view3 title:@"view3"];

    ViewController4 *view4 = [[ViewController4 alloc]init];
    [self addViewControllers:view4 title:@"view4"];
    
    
    //  照着上面添加控制球就行了
}
#pragma  mark - 添加子控制器
- (void)addViewControllers:(UIViewController *)childController title:(NSString *)title
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childController];
    childController.navigationItem.title = title;
    //  添加导航栏的背景颜色
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"sy2@2x"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
}
- (void)creatTabbar:(NSInteger)ControllersNum
{
    //  只需要该图片名字就行
    NSArray * normImage = @[@"fx9@2x",@"gd9@2x",@"fx11@2x",@"fx12@2x"];
    //  只需修改选中图片的名字
    NSArray * selectImage = @[@"sy11@2x",@"fx10@2x",@"wd13@2x",@"gd11@2x"];
    UIImageView *tabbar = [[UIImageView alloc]initWithFrame:self.tabBar.frame];
    tabbar.backgroundColor =  [UIColor whiteColor];
    tabbar.userInteractionEnabled = YES;
    for(int i = 0;i<self.viewControllers.count;i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(EACH_W(self.viewControllers.count)*i, 0, EACH_W(self.viewControllers.count), EACH_H);
        [btn setImage:[UIImage imageNamed:normImage[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selectImage[i]] forState:UIControlStateSelected];
        btn.tag = BTNTAG+i;
        [tabbar addSubview:btn];
        if(btn.tag==BTNTAG)
        {
            [self btnSelect:btn];
        }
        [btn addTarget:self action:@selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view addSubview:tabbar];
    
}
- (void)btnSelect:(UIButton *)sender
{
    NSLog(@"被点了");
    _button.selected =NO ;
    sender.selected = YES;
    _button = sender;
    self.selectedIndex = sender.tag-BTNTAG;
}
@end
