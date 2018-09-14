//
//  GetCitiesResponse.m
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import "GetCitiesResponse.h"

@implementation GetCitiesResponse

- (instancetype)initWithCities:(NSArray<City *> *)cities
{
    self = [super init];
    if (self) {
        _cities = cities;
    }
    return self;
}

@end
