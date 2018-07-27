//
//  ViewController.m
//  DiYDetailPageDemo
//
//  Created by MacOS on 2018/7/16.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "TableModel.h"
#import "CollectionModel.h"
#import "UIImageView+WebCache.h"
#import "SDCycleScrollView.h"
#import "MyTopView.h"
#import "MyBottomView.h"

#define SCW [UIScreen mainScreen].bounds.size.width
#define SCH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *mytableView;
@property (nonatomic,strong) NSArray *tableDataArray;
@property (nonatomic,strong) NSArray *topHeadBannerArray;
@property (nonatomic,strong) MyTopView *myTopView;
@property (nonatomic,strong) MyBottomView *myBottomView;
@property (nonatomic,strong) UISegmentedControl *mySegmentedControl;
@property (nonatomic,strong) UILabel *mySegmentedControlLine;
@property (nonatomic,strong) NSArray *collectionDataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar addSubview:self.mySegmentedControl];
    [self.mySegmentedControl addSubview:self.mySegmentedControlLine];
    NSLog(@"viewDidLoad");
    
    [self getData];
    
    [self makeHeadTopView];
    [self makeBottomView];

    [self.view addSubview:self.mytableView];
    
}
-(void)makeHeadTopView{
    
    _myTopView = [[MyTopView alloc] initWithBannerArray:self.topHeadBannerArray];
    _myTopView.backgroundColor = [UIColor whiteColor];
}
-(void)makeBottomView{
    
    _myBottomView = [[MyBottomView alloc] init];
    _myBottomView.backgroundColor = [UIColor whiteColor];
}
-(void)getData{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"API" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *roodic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSMutableArray *collectArr = [[NSMutableArray alloc] init];
    
    self.tableDataArray = [NSArray arrayWithArray:roodic[@"detailImageArr"]];
    
    self.topHeadBannerArray = [NSArray arrayWithArray:roodic[@"bannerArray"]];
    
    for (NSDictionary *dic in roodic[@"data"]) {
        
        CollectionModel *model = [CollectionModel modelWithDictionary:dic];
        
        [collectArr addObject:model];
    }
    self.collectionDataArray = [NSArray arrayWithArray:collectArr];
    [_mytableView reloadData];
    NSLog(@"%ld,%ld",_tableDataArray.count,_collectionDataArray.count);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return _myTopView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1100;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return _myBottomView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 1535;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 先从缓存中查找图片
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey: _tableDataArray[indexPath.row]];
    
    // 没有找到已下载的图片就使用默认的占位图，当然高度也是默认的高度了，除了高度不固定的文字部分。
    if (!image) {
        image = [UIImage imageNamed:@"1"];
        return 400;
        
    }else{
        
        //手动计算cell
        CGFloat imgHeight = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
        return imgHeight;
    }
    
    //return 450;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCellID"];
    if (cell == nil) {
        cell = [[MyTableViewCell
                 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTableViewCellID"];
    }
    //cell.model = _tableDataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.productImageView sd_setImageWithURL:[NSURL URLWithString:_tableDataArray[indexPath.row]] placeholderImage:[UIImage imageNamed:@"1"]];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(void)SegmentOnClick:(UISegmentedControl *)segmentedControl{
    
    NSLog(@"segmentedControl.selectedSegmentIndex = %ld",(long)segmentedControl.selectedSegmentIndex);
    
    if (segmentedControl.selectedSegmentIndex == 0) {
        _mySegmentedControlLine.frame = CGRectMake(12, 44-4, 200/3 -24, 3);
        [_mytableView setContentOffset:CGPointMake(0, 0)];
    }else if (segmentedControl.selectedSegmentIndex == 1){
        _mySegmentedControlLine.frame = CGRectMake(200/3 + 12, 44-4, 200/3 -24, 3);
        [_mytableView setContentOffset:CGPointMake(0, 1100)];
    }else if (segmentedControl.selectedSegmentIndex == 2){
        _mySegmentedControlLine.frame = CGRectMake(200/3 + 200/3 + 12, 44-4, 200/3 -24, 3);
        [_mytableView setContentOffset:CGPointMake(0, _mytableView.contentSize.height  - 1535 + 1)];
    }
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    float y = scrollView.contentOffset.y;
    NSLog(@"%f",y);
    
    if (y > 1100 && y < _mytableView.contentSize.height - 1535) {
        [_mySegmentedControl setSelectedSegmentIndex:1] ;
        _mySegmentedControlLine.frame = CGRectMake(200/3 + 12, 44-4, 200/3 -24, 3);
    }else if(y < 1100 && y > 0){
        [_mySegmentedControl setSelectedSegmentIndex:0];
        _mySegmentedControlLine.frame = CGRectMake(12, 44-4, 200/3 -24, 3);
    }else if(y == 1100 ){
        [_mySegmentedControl setSelectedSegmentIndex:1];
        _mySegmentedControlLine.frame = CGRectMake(200/3 + 12, 44-4, 200/3 -24, 3);
    }else if(y <= 0){
        [_mySegmentedControl setSelectedSegmentIndex:0];
        _mySegmentedControlLine.frame = CGRectMake(12, 44-4, 200/3 -24, 3);
    }else{
        _mySegmentedControlLine.frame = CGRectMake(200/3 + 200/3 + 12, 44-4, 200/3 -24, 3);
        [_mySegmentedControl setSelectedSegmentIndex:2];
    }
}

-(UITableView *)mytableView{
    if (!_mytableView) {
        _mytableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCW, SCH-64) style:UITableViewStyleGrouped];//CGRectMake(0, 0, SCW, 1300)
        _mytableView.delegate = self;
        _mytableView.dataSource = self;
        [_mytableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCellID"];
        //解决上拉跳跃式加载问题
        if (@available(iOS 11.0, *)) {
            _mytableView.estimatedRowHeight = 0;
            _mytableView.estimatedSectionFooterHeight = 0;
            _mytableView.estimatedSectionHeaderHeight = 0;
            _mytableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _mytableView;
}
-(UISegmentedControl *)mySegmentedControl{
    if (!_mySegmentedControl) {
        _mySegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"宝贝",@"详情",@"推荐"]];
        //添加点击方法 添加事件
        [_mySegmentedControl addTarget:self action:@selector(SegmentOnClick:) forControlEvents:UIControlEventValueChanged];
        _mySegmentedControl.frame = CGRectMake(0, 0, 200, 44);
        _mySegmentedControl.center = CGPointMake(SCW/2, 44/2);
        _mySegmentedControl.tintColor = [UIColor clearColor];
        //_mySegmentedControl.backgroundColor = [UIColor redColor];
        //默认颜色
        [_mySegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} forState:UIControlStateNormal];
        //点击后的颜色
        [_mySegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:18.0f]} forState:UIControlStateSelected];
        _mySegmentedControl.selectedSegmentIndex = 0;
    }
    return _mySegmentedControl;
}
-(UILabel *)mySegmentedControlLine{
    if (!_mySegmentedControlLine) {
        _mySegmentedControlLine = [[UILabel alloc] initWithFrame:CGRectMake(12, 44-4, 200/3 -24, 3)];
        _mySegmentedControlLine.backgroundColor = [UIColor orangeColor];
    }
    return _mySegmentedControlLine;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
