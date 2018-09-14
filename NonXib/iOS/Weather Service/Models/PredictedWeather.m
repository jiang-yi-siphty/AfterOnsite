//
//  PredictedWeather.m
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import "PredictedWeather.h"

@implementation PredictedWeather

- (instancetype)initWithMinTempCelsius:(NSNumber *)minTempCelsius maxTempCelsius:(NSNumber *)maxTempCelsius shortDescription:(NSString *)shortDescription
{
    self = [super init];
    if (self) {
        _minTempCelsius = minTempCelsius;
        _maxTempCelsius = maxTempCelsius;
        _shortDescription = shortDescription;
    }
    return self;
}

@end
