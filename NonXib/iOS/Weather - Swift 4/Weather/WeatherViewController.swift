//
//  WeatherViewController.swift
//  Weather
//
//  Created by Yi JIANG on 17/9/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    var city: City?
    var currentWeather: CurrentWeather?
    var backButton: UIButton? = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = WeatherService()
        let weatherCityResponse = service.getWeatherForCity(city?.name)
        currentWeather = weatherCityResponse?.currentWeather
        
        makeBackButton()
        makeWeatherDetailView()
    }
    
    fileprivate func makeBackButton() {
        backButton = UIButton()
        guard let backButton = backButton else { return }
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        view.addSubview(backButton)
        if #available(iOS 11.0, *) {
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        } else {
            backButton.frame = CGRect(x: 10, y: 10, width: view.bounds.width - 20, height: 44)
        }
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc func dismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func makeWeatherDetailView() {
        guard let backButton = backButton else { return }
        let weatherDetailView = UIView()
        view.addSubview(weatherDetailView)
        weatherDetailView.translatesAutoresizingMaskIntoConstraints = false
        weatherDetailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherDetailView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40).isActive = true
        weatherDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        weatherDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.spacing = 15
        mainStackView.alignment = .center
        weatherDetailView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.centerXAnchor.constraint(equalTo: weatherDetailView.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: weatherDetailView.centerYAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: weatherDetailView.widthAnchor).isActive = true
        mainStackView.heightAnchor.constraint(equalTo: weatherDetailView.heightAnchor).isActive = true
        
        
        let cityNameLabel = UILabel()
        cityNameLabel.text = city?.name
        cityNameLabel.font = .boldSystemFont(ofSize: 24)
        mainStackView.addArrangedSubview(cityNameLabel)
        
        let weatherDescriptionTextView = UITextView()
        weatherDescriptionTextView.text = currentWeather?.longDescription
        weatherDescriptionTextView.textAlignment = .justified
        weatherDescriptionTextView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        weatherDescriptionTextView.font = .systemFont(ofSize: 16)
        weatherDescriptionTextView.isScrollEnabled = false //Without this line, the text view wouldn't show.
        mainStackView.addArrangedSubview(weatherDescriptionTextView)
        
        let detailStackView = UIStackView()
        detailStackView.axis = .horizontal
        detailStackView.distribution = .fillEqually
        detailStackView.spacing = 10
        detailStackView.alignment = .top
        mainStackView.addArrangedSubview(detailStackView)
        
        let leftDetailStackView = UIStackView()
        leftDetailStackView.axis = .vertical
        leftDetailStackView.distribution = .equalCentering
        leftDetailStackView.spacing = 10
        leftDetailStackView.alignment = .leading
        detailStackView.addArrangedSubview(leftDetailStackView)
        
        let rightDetailStackView = UIStackView()
        rightDetailStackView.axis = .vertical
        rightDetailStackView.distribution = .equalCentering
        rightDetailStackView.spacing = 10
        rightDetailStackView.alignment = .leading
        detailStackView.addArrangedSubview(rightDetailStackView)
        
        let airPressureLabel = UILabel()
        airPressureLabel.text = String(format: "Air Press: %@",  currentWeather?.airPressureDescription ?? "-")
        let rainChanceLabel = UILabel()
        rainChanceLabel.text = String(format: "Rain Chance: %.2f%%", currentWeather?.rainChancePercent.doubleValue ?? 0.0)
        let tempreatureLabel = UILabel()
        tempreatureLabel.text = String(format: "Temperature: %.2fC",  currentWeather?.feelsLikeCelsius.doubleValue ?? 0.0)
        let humidityLabel = UILabel()
        humidityLabel.text = String(format: "Humidity: %.2f%%", currentWeather?.humidityPercent.doubleValue ?? 0.0)
        let windDirectionLabel = UILabel()
        windDirectionLabel.text =  String(format: "Wind Dirct: %@",currentWeather?.windDirection ?? "-")
        let windSpeedLabel = UILabel()
        windSpeedLabel.text = String(format: "Wind Speed: %@m/s",currentWeather?.windSpeed ?? "-")
        
        leftDetailStackView.addArrangedSubview(tempreatureLabel)
        leftDetailStackView.addArrangedSubview(humidityLabel)
        leftDetailStackView.addArrangedSubview(rainChanceLabel)
        rightDetailStackView.addArrangedSubview(airPressureLabel)
        rightDetailStackView.addArrangedSubview(windDirectionLabel)
        rightDetailStackView.addArrangedSubview(windSpeedLabel)
        
        
    }
}
