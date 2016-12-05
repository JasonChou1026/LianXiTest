//
//  MainNavController.m
//  LianXi
//
//  Created by Jason on 16/11/18.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "MainNavController.h"
#import "ContainerViewController.h"

@interface MainNavController ()

@end

@implementation MainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.view.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.view.layer setShadowOffset:CGSizeMake(-10, 0)];
    [self.view.layer setShadowRadius:10];//投影的半径
    [self.view.layer setShadowOpacity:0.15];//透明度
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count==0) {
        
        UIBarButtonItem* menuItem = [[UIBarButtonItem alloc]initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(openCloseMenu:)];
        viewController.navigationItem.leftBarButtonItem=menuItem ;
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)openCloseMenu:(UIBarButtonItem*)btn{
    
//    [self.parentViewController performSelector:@selector(openCloseMenu)];
    UIViewController *childController = self ;
    
    
    
    while (1) {
        
        UIViewController * parentController = childController.parentViewController ;
        
        if ([parentController isKindOfClass:[ContainerViewController class]] || !parentController) {
            [parentController performSelector:@selector(openCloseMenu)];
            
            break ;
        }
        else{
            childController = self.parentViewController ;
        }
    }

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
