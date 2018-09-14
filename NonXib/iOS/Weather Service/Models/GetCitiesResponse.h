//
//  GetCitiesResponse.h
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;

NS_ASSUME_NONNULL_BEGIN

@interface GetCitiesResponse : NSObject

@property (nonatomic, readonly) NSArray<City *> *cities;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithCities:(NSArray<City *> *)cities NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
