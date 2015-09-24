//
//  WeatherViewController.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "WeatherViewController.h"
#import "SimpleWeatherView.h"
#import "LeeWeatherInfo.h"
#import "UIBarButtonItem+Extension.h"
@interface WeatherViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;

@property (nonatomic, strong) NSArray *simapleweathers;
@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"天气预报";
     self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(Cancel) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
    // 添加simapleweather
    [self setupSimapleWeathers];
    
    // 设置天气数据
    [self setupWeatherInfo];
}
- (void)Cancel
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setupSimapleWeathers
{
    
    CGFloat simapleWeatherX = 0;
    CGFloat simapleX = 12;
    CGFloat simapleWeatherY = CGRectGetMaxY(self.detailLabel.frame);
    CGFloat simapleWeatherH = 200;
    CGFloat simapleWeatherW = (self.view.frame.size.width - 2 * simapleX)/3;
    
    NSMutableArray *simapleWeathers = [NSMutableArray array];
    for (int i = 0; i < 3; ++i) {
        SimpleWeatherView *simapleWeather = [SimpleWeatherView createView];
        [self.view addSubview:simapleWeather];
        [simapleWeathers addObject:simapleWeather];
        
        simapleWeatherX = simapleX + simapleWeatherW * i;
        simapleWeather.frame = CGRectMake(simapleWeatherX, simapleWeatherY, simapleWeatherW, simapleWeatherH);
    }
    self.simapleweathers = simapleWeathers;
}

- (void)setupWeatherInfo
{
    LeeWeatherData *weatherData = self.weatherInfo.weather_data[0];
    LeeIndexDetail *detail = self.weatherInfo.index[0];
    
    self.cityLabel.text = self.weatherInfo.currentCity;
    self.dateLabel.text = self.weatherInfo.date;
    self.weekLabel.text = [weatherData.date substringToIndex:3];
    self.tempLabel.text = weatherData.temperature;
    NSString *weather = weatherData.weather;
    NSUInteger strLocation = [weather rangeOfString:@"转"].location;
    if (strLocation != NSNotFound) {
        weather = [weather substringToIndex:strLocation];
    }
    self.weatherImageView.image = [UIImage imageNamed:weather];
    self.windLabel.text = weatherData.wind;
    self.weatherLabel.text = weatherData.weather;
    self.detailLabel.text = [NSString stringWithFormat:@"%@: %@",detail.tipt,detail.des];
    
    for (int i = 1; i < 4; ++i) {
        weatherData = self.weatherInfo.weather_data[i];
        SimpleWeatherView *simpleView = self.simapleweathers[i-1];
        simpleView.weekLable.text = weatherData.date;
        NSString *weather = weatherData.weather;
        NSUInteger strLocation = [weather rangeOfString:@"转"].location;
        if (strLocation != NSNotFound) {
            weather = [weather substringToIndex:strLocation];
        }
        simpleView.weatherImageView.image = [UIImage imageNamed:weather];
        simpleView.weatherLable.text = weatherData.weather;
        simpleView.windLable.text = weatherData.wind;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
