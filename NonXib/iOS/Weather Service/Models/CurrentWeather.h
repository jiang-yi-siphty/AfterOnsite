//
//  CurrentWeather.h
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurrentWeather : NSObject

@property (nonatomic, readonly) NSString *longDescription;
@property (nonatomic, readonly) NSNumber *feelsLikeCelsius;
@property (nonatomic, readonly) NSNumber *rainChancePercent;
@property (nonatomic, readonly) NSNumber *humidityPercent;
@property (nonatomic, readonly) NSString *airPressureDescription;
@property (nonatomic, readonly) NSString *windDirection;
@property (nonatomic, readonly) NSNumber *windSpeed;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithLongDescription:(NSString *)longDescription
                       feelsLikeCelsius:(NSNumber *)feelsLikeCelsius
                      rainChancePercent:(NSNumber *)rainChancePercent
                        humidityPercent:(NSNumber *)humidityPercent
                 airPressureDescription:(NSString *)airPressureDescription
                          windDirection:(NSString *)windDirection
                              windSpeed:(NSNumber *)windSpeed NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
