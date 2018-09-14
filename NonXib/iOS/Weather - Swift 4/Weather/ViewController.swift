//
//  ViewController.swift
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var tableView = UITableView()
    private var cities = [City]()
    private var countyGroupDic = [String:[City]]()
    private var sortedCountyGroupArray = [(String, [City])]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = WeatherService()
        let citiesResponse = service.getCities()
        cities = (citiesResponse?.cities)!
        countyGroupDic = Dictionary(grouping: cities, by: { $0.countryName })
        sortedCountyGroupArray = countyGroupDic.sorted { $0.0 < $1.0 }
        let weatherCityResponse = service.getWeatherForCity("sanfrancisco")
        
        print(citiesResponse?.cities.first?.name ?? "")
        print(weatherCityResponse?.currentWeather.longDescription ?? "")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedCountyGroupArray[section].1.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedCountyGroupArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel?.text = sortedCountyGroupArray[indexPath.section].1[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedCountyGroupArray[section].0
    }
    
}
