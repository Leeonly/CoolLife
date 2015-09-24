//
//  IPSearchController.m
//  KnowingLife
//
//  Created by tanyang on 14/10/30.
//  Copyright (c) 2014年 tany. All rights reserved.
//

#import "IPSearchController.h"
#import "RETableViewManager.h"
#import "MBProgressHUD+MJ.h"
#import "LeeSearchHttpTool.h"

@interface IPSearchController ()
@property (nonatomic, strong) RETableViewManager *manager;
@property (nonatomic, strong) RETextItem *IPItem;
@property (nonatomic, strong) RETableViewSection *resultSection;
@end

@implementation IPSearchController

- (instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"IP地址查询";
    
    self.manager = [[RETableViewManager alloc]initWithTableView:self.tableView];
    self.manager.style.cellHeight = 36;
    
    // 添加第一个组 查询
    [self addSectionSearch];
    
    // 添加第二个组 结果
    [self addSectionResult];
    
    // 添加第三组 查询按钮
    [self addSectionButton];
}

// 添加第一个组 查询
- (void)addSectionSearch
{
    UIImage *image = [UIImage imageNamed:@"a5"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.bounds = CGRectMake(0, 0, self.view.frame.size.width, 100);
    imageView.contentMode = UIViewContentModeCenter;
    
    // 添加头部视图
    RETableViewSection *headerSection = [RETableViewSection sectionWithHeaderView:imageView];
    [self.manager addSection:headerSection];
    headerSection.footerTitle = @"可以查询指定IP的物理地址或域名服务器的IP和物理地址，及所在国家或城市，甚至精确到某个网吧，机房或学校等";
    
    RETextItem *IPItem = [RETextItem itemWithTitle:@"IP地址:" value:nil placeholder:@"请输入要查询的IP地址"];
    IPItem.keyboardType = UIKeyboardTypeDecimalPad;
    [headerSection addItem:IPItem];
    self.IPItem = IPItem;
    
}

// 添加第二个组 结果
- (void)addSectionResult
{
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"查询结果:"];
    [self.manager addSection:section];
    self.resultSection = section;
}

- (void)addSectionButton
{
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    
    // 消除强引用
    __typeof (self) __weak weakSelf = self;
    RETableViewItem *buttonItem = [RETableViewItem itemWithTitle:@"查询" accessoryType:UITableViewCellAccessoryNone selectionHandler:^(RETableViewItem *item) {
        //item.title = @"Pressed!";
        
        if (weakSelf.IPItem.value) {
            // 查询数据
            [weakSelf getIPDataWithIP:weakSelf.IPItem.value];
            [MBProgressHUD showMessage:@"查询中..."];
        }
        
        // item取消选择
        [item deselectRowAnimated:UITableViewRowAnimationAutomatic];
    }];
    buttonItem.textAlignment = NSTextAlignmentCenter;
    [section addItem:buttonItem];
    
}

- (void)getIPDataWithIP:(NSString *)IP
{
    __typeof (self) __weak weakSelf = self;
    
    [LeeSearchHttpTool getIPDataWithIP:IP success:^(NSData *data) {
        
        NSMutableDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSMutableDictionary *dic = [dataDict objectForKey:@"retData"];
        NSNumber *error = dataDict[@"errNum"];
        
        
        // 清除所有items
        [weakSelf.resultSection removeAllItems];
        
        if (error.integerValue == 0 ) {
            // 返回成功
            // ip
            [weakSelf.resultSection addItem:[WBSubtitleItem itemWithTitle:@"IP地址:" rightSubtitle:dic[@"ip"]]];
            
            // 运营商
            [weakSelf.resultSection addItem:[WBSubtitleItem itemWithTitle:@"IP拥有商:" rightSubtitle:dic[@"carrier"]]];
            
            //
            [weakSelf.resultSection addItem:[WBSubtitleItem itemWithTitle:@"国家:" rightSubtitle:dic[@"country"]]];
            
            //
            [weakSelf.resultSection addItem:[WBSubtitleItem itemWithTitle:@"省份:" rightSubtitle:dic[@"province"]]];
            
            //
            [weakSelf.resultSection addItem:[WBSubtitleItem itemWithTitle:@"城市:" rightSubtitle:dic[@"city"]]];
            [weakSelf.resultSection addItem:[WBSubtitleItem itemWithTitle:@"地区:" rightSubtitle:dic[@"district"]]];
            
            
        } else {
            // 查询失败
            [weakSelf.resultSection addItem:@"查询失败，输入是否正确!"];
        }
        
        // 重新加载section
        [weakSelf.resultSection reloadSectionWithAnimation:UITableViewRowAnimationAutomatic];
        
        [MBProgressHUD hideHUD];
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
    }];
}

/*{
 "errNum": 0,
 "errMsg": "success",
 "retData": {
 "ip": "117.89.35.58",
 "country": "中国",
 "province": "江苏",
 "city": "南京",
 "district": "鼓楼",
 "carrier": "中国电信"
 }
 }*/

- (void)dealloc
{
    LeeLog(@"IPSearchController dealloc");
}

@end
