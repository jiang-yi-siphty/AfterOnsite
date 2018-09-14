//
//  WeatherService.m
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WeatherService.h"

@implementation WeatherService

- (GetCitiesResponse *)getCities
{
    [self _randomDelay];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *citiesDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    if (citiesDict) {
        NSMutableArray *cities = [NSMutableArray array];
        
        NSMutableArray *cityDictionaries = [NSMutableArray arrayWithArray:citiesDict[@"cities"]];
        NSMutableArray *shuffledCityDictionaries = [NSMutableArray array];
        
        while (cityDictionaries.count > 0) {
            NSUInteger cityIndex = arc4random() % cityDictionaries.count;
            NSDictionary *cityDict = [cityDictionaries objectAtIndex:cityIndex];
            
            [shuffledCityDictionaries addObject:cityDict];
            [cityDictionaries removeObjectAtIndex:cityIndex];
        }
        
        for (NSDictionary *cityDict in shuffledCityDictionaries) {
            City *city = [[City alloc] initWithName:cityDict[@"name"]
                                        countryName:cityDict[@"country"]
                                           latitude:cityDict[@"lat"]
                                         longtitude:cityDict[@"long"]];
            [cities addObject:city];
        }
        
        GetCitiesResponse *response = [[GetCitiesResponse alloc] initWithCities:[cities copy]];
        return response;
    }
    
    return nil;
}

- (GetWeatherForCityResponse *)getWeatherForCity:(NSString *)cityName
{
    [self _randomDelay];
    
    NSString *fileName = [cityName stringByReplacingOccurrencesOfString:@" " withString:@""].lowercaseString;
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data == nil) {
        return nil;
    }
    
    NSDictionary *cityDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    if (cityDict) {
        CurrentWeather *currentWeather = [[CurrentWeather alloc] initWithLongDescription:cityDict[@"longDescription"]
                                                                        feelsLikeCelsius:cityDict[@"feelsLike"]
                                                                       rainChancePercent:cityDict[@"rainChance"]
                                                                         humidityPercent:cityDict[@"humidity"]
                                                                  airPressureDescription:cityDict[@"airPressure"]
                                                                           windDirection:cityDict[@"wind"][@"direction"]
                                                                               windSpeed:cityDict[@"wind"][@"speed"]];
        
        NSMutableDictionary<NSString *, PredictedWeather *> *predictedWeatherForDays = [NSMutableDictionary dictionary];
        NSDictionary *sevenDaysDict = cityDict[@"sevenDay"];
        for (NSString *key in sevenDaysDict.allKeys) {
            NSDictionary *dayDict = sevenDaysDict[key];
            PredictedWeather *predictedWeather = [[PredictedWeather alloc] initWithMinTempCelsius:dayDict[@"minTemp"]
                                                                                   maxTempCelsius:dayDict[@"maxTemp"]
                                                                                 shortDescription:dayDict[@"shortDescription"]];
            predictedWeatherForDays[key] = predictedWeather;
        }
        GetWeatherForCityResponse *response = [[GetWeatherForCityResponse alloc] initWithCurrentWeather:currentWeather predictedWeatherForDays:[predictedWeatherForDays copy]];
        return response;
    }
    
    return nil;
}

#pragma mark - Private

- (void)_randomDelay
{
    NSInteger randomNumber = arc4random() % 5;
    [NSThread sleepForTimeInterval:randomNumber];
}

@end
