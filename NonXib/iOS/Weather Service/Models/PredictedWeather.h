//
//  PredictedWeather.h
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PredictedWeather : NSObject

@property (nonatomic, readonly) NSNumber *minTempCelsius;
@property (nonatomic, readonly) NSNumber *maxTempCelsius;
@property (nonatomic, readonly) NSString *shortDescription;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithMinTempCelsius:(NSNumber *)minTempCelsius
                        maxTempCelsius:(NSNumber *)maxTempCelsius
                      shortDescription:(NSString *)shortDescription NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
