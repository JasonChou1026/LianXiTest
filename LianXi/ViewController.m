//
//  ViewController.m
//  LianXi
//
//  Created by Jason on 16/11/15.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *_allArray;//创建一个数据源数组
    NSMutableDictionary *dic;//创建一个字典进行判断收缩还是展开
}




@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    dic = [NSMutableDictionary dictionary];
    _allArray = [NSMutableArray new];
    _allArray = [@[@[@"12",@"32",@"12",@"12",@"12",@"32"],@[@"12",@"12",@"12",@"32",@"12",@"12",@"12",@"32",@"12",@"12",@"12",@"32"],@[@"12",@"12",@"32"]]mutableCopy];
    [self.view addSubview:self.myTableView];
    _myTableView.backgroundColor  = [UIColor grayColor];
}

//懒加载
- (UITableView *)tableView{
    if (!_myTableView) {
       
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _allArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
//
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    //创建一个手势进行点击，这里可以换成button
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action_tap:)];
    view.tag = 300 + section;
    [view addGestureRecognizer:tap];
    return view;
}

- (void)action_tap:(UIGestureRecognizer *)tap{
    NSString *str = [NSString stringWithFormat:@"%ld",tap.view.tag - 300];
    if ([dic[str] integerValue] == 0) {//如果是0，就把1赋给字典,打开cell
        [dic setObject:@"1" forKey:str];
    }else{//反之关闭cell
        [dic setObject:@"0" forKey:str];
    }
    // [self.tableView reloadData];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:[str integerValue]] withRowAnimation:UITableViewRowAnimationFade];//有动画的刷新
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *string = [NSString stringWithFormat:@"%ld",section];
    if ([dic[string] integerValue] == 1 ) {  //打开cell返回数组的count
        NSArray *array = [NSArray arrayWithArray:_allArray[section]];
        return array.count;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = _allArray[indexPath.section][indexPath.row];
    return cell;
}

@end
