//
//  MenuViewController.m
//  LianXi
//
//  Created by Jason on 16/11/17.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

-(void)addMenuItems;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view .backgroundColor = [UIColor grayColor];
    [self addMenuItems];
}

-(void)addMenuItems{
    
    UIButton*item1 = [UIButton buttonWithType:UIButtonTypeCustom];
    item1.frame = CGRectMake(0, 100, 180, 40);
    item1 .backgroundColor = [UIColor orangeColor];
    [item1 setTitle:@"Item1" forState:UIControlStateNormal];
    item1.titleLabel .font = [UIFont boldSystemFontOfSize:20];
    item1.tag = 1 ;
    [self.view addSubview:item1];
    
    UIButton*item2 = [UIButton buttonWithType:UIButtonTypeCustom];
    item2.frame = CGRectMake(0, 140, 180, 40);
    item2 .backgroundColor = [UIColor blackColor];
    [item2 setTitle:@"Item2" forState:UIControlStateNormal];
    item2.titleLabel .font = [UIFont boldSystemFontOfSize:20];
    item2.tag = 2 ;
    [self.view addSubview:item2];
    
    [item1 addTarget:self action:@selector(menuItemSelected:) forControlEvents:UIControlEventTouchUpInside];
    [item2 addTarget:self action:@selector(menuItemSelected:) forControlEvents:UIControlEventTouchUpInside];

    
    
}

-(void)menuItemSelected:(UIButton   *)btn{
    
    [self.delegate menuCoontroller:self didSelectItemAtIndex:btn.tag-1];
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
