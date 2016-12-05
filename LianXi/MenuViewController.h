//
//  MenuViewController.h
//  LianXi
//
//  Created by Jason on 16/11/17.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuViewController;
@protocol MenuControllerDelegate <NSObject>

-(void)menuCoontroller:(MenuViewController*)controller didSelectItemAtIndex:(NSInteger)index ;

@end


@interface MenuViewController : UIViewController


@property (nonatomic,weak) id<MenuControllerDelegate>delegate ;

@end
