//
//  GetWeatherForCityResponse.m
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import "GetWeatherForCityResponse.h"

@implementation GetWeatherForCityResponse

- (instancetype)initWithCurrentWeather:(CurrentWeather *)currentWeather predictedWeatherForDays:(NSDictionary<NSString *, PredictedWeather *> *)predictedWeatherForDays
{
    self = [super init];
    if (self) {
        _currentWeather = currentWeather;
        _predictedWeatherForDays = predictedWeatherForDays;
    }
    return self;
}

@end
