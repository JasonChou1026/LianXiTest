//
//  ContainerViewController.h
//  LianXi
//
//  Created by Jason on 16/11/17.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

@interface ContainerViewController : UIViewController


@property (nonatomic,strong)MenuViewController* menuViewCorl ;

@property (nonatomic,strong)UIViewController *contentController ;
//@property (nonatomic,strong)NSArray* viewControllers ;
@property (nonatomic,assign,readonly)BOOL isMenuOpen ;
@property (nonatomic,assign,readonly)BOOL isAnimating ;


-(void)openCloseMenu;

@end
