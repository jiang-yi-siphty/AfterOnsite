//
//  GetWeatherForCityResponse.h
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CurrentWeather;
@class PredictedWeather;

NS_ASSUME_NONNULL_BEGIN

@interface GetWeatherForCityResponse : NSObject

@property (nonatomic, readonly) CurrentWeather *currentWeather;
@property (nonatomic, readonly) NSDictionary<NSString *, PredictedWeather *> *predictedWeatherForDays;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithCurrentWeather:(CurrentWeather *)currentWeather predictedWeatherForDays:(NSDictionary<NSString *, PredictedWeather *> *)predictedWeatherForDays NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
