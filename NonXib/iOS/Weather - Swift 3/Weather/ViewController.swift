//
//  ViewController.swift
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let service = WeatherService()
        let citiesResponse = service.getCities()
        let weatherCityResponse = service.getWeatherForCity("sanfrancisco")

        print(citiesResponse?.cities.first?.name ?? "")
        print(weatherCityResponse?.currentWeather.longDescription ?? "")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

