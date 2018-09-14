//
//  ViewController.m
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewController.h"

#import "WeatherService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WeatherService *service = [[WeatherService alloc] init];
    GetCitiesResponse *citiesResponse = [service getCities];
    GetWeatherForCityResponse *weatherResponse = [service getWeatherForCity:@"sanfrancisco"];

    NSLog(@"%@", citiesResponse.cities);
    NSLog(@"%@", weatherResponse.currentWeather.longDescription);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
