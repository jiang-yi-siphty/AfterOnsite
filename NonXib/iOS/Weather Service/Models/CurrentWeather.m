//
//  CurrentWeather.m
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import "CurrentWeather.h"

@implementation CurrentWeather

- (instancetype)initWithLongDescription:(NSString *)longDescription feelsLikeCelsius:(NSNumber *)feelsLikeCelsius rainChancePercent:(NSNumber *)rainChancePercent humidityPercent:(NSNumber *)humidityPercent airPressureDescription:(NSString *)airPressureDescription windDirection:(NSString *)windDirection windSpeed:(NSNumber *)windSpeed
{
    self = [super init];
    if (self) {
        _longDescription = longDescription;
        _feelsLikeCelsius = feelsLikeCelsius;
        _rainChancePercent = rainChancePercent;
        _humidityPercent = humidityPercent;
        _airPressureDescription = airPressureDescription;
        _windDirection = windDirection;
        _windSpeed = windSpeed;
    }
    return self;
}

@end
