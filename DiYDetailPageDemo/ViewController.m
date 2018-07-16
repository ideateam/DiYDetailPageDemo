//
//  ViewController.m
//  DiYDetailPageDemo
//
//  Created by MacOS on 2018/7/16.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "MyModel.h"

#define SCW [UIScreen mainScreen].bounds.size.width
#define SCH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *mytableView;
@property (nonatomic,strong) UIView *myTopView;
@property (nonatomic,strong) UIView *myBottomView;
@property (nonatomic,strong) UISegmentedControl *mySegmentedControl;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar addSubview:self.mySegmentedControl];
    [self.view addSubview:self.mytableView];
    //_mytableView.tableHeaderView = self.myTopView;
    //_mytableView.tableFooterView = self.myBottomView;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.myTopView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 800;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.myBottomView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        return 800 + 800;
    }else{
        return 0;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCellID"];
    if (cell == nil) {
        cell = [[MyTableViewCell
                 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTableViewCellID"];
    }
    cell.model = _dataArray[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(void)SegmentOnClick:(UISegmentedControl *)segmentedControl{
    
    NSLog(@"segmentedControl.selectedSegmentIndex = %ld",(long)segmentedControl.selectedSegmentIndex);
    
    if (segmentedControl.selectedSegmentIndex == 0) {
        [_mytableView setContentOffset:CGPointMake(0, 0)];
    }else if (segmentedControl.selectedSegmentIndex == 1){
        [_mytableView setContentOffset:CGPointMake(0, 800)];
    }else if (segmentedControl.selectedSegmentIndex == 2){
        [_mytableView setContentOffset:CGPointMake(0, 2100 + 700)];
    }
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    float y = scrollView.contentOffset.y;
    NSLog(@"%f",y);
    
    if (y >= 800 && y < 800 + 1300 + SCW + 200) {
        _mySegmentedControl.selectedSegmentIndex = 1 ;
    }else if(y < 800){
        _mySegmentedControl.selectedSegmentIndex = 0;
    }else{
        _mySegmentedControl.selectedSegmentIndex = 2;
    }
}
-(UITableView *)mytableView{
    if (!_mytableView) {
        _mytableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCW, 1300) style:UITableViewStyleGrouped];
        _mytableView.delegate = self;
        _mytableView.dataSource = self;
        [_mytableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCellID"];
    }
    return _mytableView;
}
-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSArray alloc] init];
    }
    return _dataArray;
}
-(UIView *)myTopView{
    if (!_myTopView) {
        _myTopView = [[UIView alloc] init];
        _myTopView.backgroundColor = [UIColor orangeColor];
    }
    return _myTopView;
}
-(UIView *)myBottomView{
    if (!_myBottomView) {
        _myBottomView = [[UIView alloc] init];
        _myBottomView.backgroundColor = [UIColor blueColor];
    }
    return _myBottomView;
}
-(UISegmentedControl *)mySegmentedControl{
    if (!_mySegmentedControl) {
        _mySegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"宝贝",@"详情",@"推荐"]];
        //添加点击方法 添加事件
        [_mySegmentedControl addTarget:self action:@selector(SegmentOnClick:) forControlEvents:UIControlEventValueChanged];
        _mySegmentedControl.frame = CGRectMake(0, 0, 200, 44);
        _mySegmentedControl.center = CGPointMake(SCW/2, 44/2);
        _mySegmentedControl.tintColor = [UIColor clearColor];
        //默认颜色
        [_mySegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} forState:UIControlStateNormal];
        //点击后的颜色
        [_mySegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:18.0f]} forState:UIControlStateSelected];
        _mySegmentedControl.selectedSegmentIndex = 0;
    }
    return _mySegmentedControl;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
