//
//  WeatherService.h
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "City.h"
#import "CurrentWeather.h"
#import "PredictedWeather.h"
#import "GetCitiesResponse.h"
#import "GetWeatherForCityResponse.h"

@interface WeatherService : NSObject

- (GetCitiesResponse *)getCities;

- (GetWeatherForCityResponse *)getWeatherForCity:(NSString *)cityName;

@end
