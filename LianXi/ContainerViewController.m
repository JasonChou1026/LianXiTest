//
//  ContainerViewController.m
//  LianXi
//
//  Created by Jason on 16/11/17.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ContainerViewController.h"

#import "MainNavController.h"
#import "MainTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface ContainerViewController ()<MenuControllerDelegate>
@property (nonatomic,assign)NSUInteger controllerIndex ;
-(void)addMenuController ;

-(void)addContenControllers;


@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addMenuController];
    [self addContenControllers];
}


-(void)addContenControllers{
    
    MainTabBarController*tabController = [[MainTabBarController alloc]init];
    
    [self setContentController:tabController];
}

-(void)addMenuController{
    
    self.menuViewCorl= [[MenuViewController alloc]init];
    self.menuViewCorl.delegate = self ;
    
    [self addChildViewController:self.menuViewCorl];
    [self.view addSubview:self.menuViewCorl.view];
}

-(void)setContentController:(UIViewController *)contentController{
    
    if (_contentController == contentController) {
        return ;
    }
    
    if (_contentController) {
        contentController.view.transform = _contentController.view.transform ;
    }
    
    [_contentController willMoveToParentViewController:nil];
    [_contentController.view removeFromSuperview];
    [_contentController removeFromParentViewController];
    
    _contentController = contentController ;
    [self addChildViewController:contentController];
    [self.view addSubview:contentController.view];
    
}


-(void)openCloseMenu{
    
    if (_isAnimating) {
        return ;
    }
    
    [UIView animateWithDuration:0.15 animations:^{
        
        _isAnimating = YES ;
        
        if (!_isMenuOpen) {
            _contentController.view.transform = CGAffineTransformMakeTranslation(180, 0);
        
        }
        
        else{
            self.contentController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(self.view.bounds), 0);
        }
    }
     completion:^(BOOL finished) {
         _isMenuOpen = !_isMenuOpen ;
//         self.contentController = self.viewControllers[self.controllerIndex];
         
         if (!_isMenuOpen) {
             [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
                 self.contentController.view.transform= CGAffineTransformIdentity;
             } completion:^(BOOL finished) {
                 _isAnimating = NO;
             }];
         }
         else{
             _isAnimating = NO ;
         }
     }
     
     ];
}

-(void)menuCoontroller:(MenuViewController *)controller didSelectItemAtIndex:(NSInteger)index
{
    MainTabBarController*tabBarController =(MainTabBarController*) self.contentController ;
    if (index==0) {
        FirstViewController *first = [[FirstViewController alloc]init];
        [(UINavigationController*)  tabBarController.selectedViewController pushViewController:first animated:NO];
    }
    
    else{
        SecondViewController *second = [[SecondViewController alloc]init];
        [(UINavigationController*)  tabBarController.selectedViewController pushViewController:second animated:NO];
    }
   // [self setControllerIndex:index];
    [self openCloseMenu];
    
    
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
