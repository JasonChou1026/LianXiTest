//
//  MainTabBarController.m
//  LianXi
//
//  Created by Jason on 16/11/18.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIViewController*itemOneController = [[UIViewController alloc]init];
    itemOneController.title = @"One";
    itemOneController.view.backgroundColor = [UIColor whiteColor];
    MainNavController*navOneController = [[MainNavController alloc]initWithRootViewController:itemOneController];
    
    UIViewController*itemTwoController = [[UIViewController alloc]init];
    itemTwoController.title = @"Two";
    itemTwoController.view.backgroundColor = [UIColor lightGrayColor];
    MainNavController*navTwoController = [[MainNavController alloc]initWithRootViewController:itemTwoController];

    self.viewControllers = @[navOneController,navTwoController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
