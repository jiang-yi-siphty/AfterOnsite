//
//  ViewController.swift
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var tableView = UITableView()
    private var collectionView =  UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private var cities = [City]()
    private var countyGroupDic = [String:[City]]()
    private var sortedCountyGroupArray = [(String, [City])]()
    private var isShowingTableView = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Update data from service
        let service = WeatherService()
        let citiesResponse = service.getCities()
        cities = (citiesResponse?.cities)!
        countyGroupDic = Dictionary(grouping: cities, by: { $0.countryName })
        sortedCountyGroupArray = countyGroupDic.sorted { $0.0 < $1.0 }
        //UI
        title = "City List"
        let tableViewCollectionViewSwitcher = UIBarButtonItem(barButtonSystemItem: .organize , target: self, action: #selector(switchCollectionOrTabelView))
        navigationItem.rightBarButtonItems = [tableViewCollectionViewSwitcher]
        addTabelView()
    }
    
    @objc func switchCollectionOrTabelView() {
        if tableView.superview != nil {
            removeTabelView()
            addCollectionView()
        } else {
            removeCollectionView()
            addTabelView()
        }
    }
    
    private func addTabelView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TabelViewCell")
        tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.reloadData()
    }
    private func removeTabelView() {
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.removeFromSuperview()
    }
    
    private func addCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        collectionView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.reloadData()
    }
    
    private func removeCollectionView() {
        collectionView.delegate = nil
        collectionView.dataSource = nil
        collectionView.removeFromSuperview()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TabelViewCell", for: indexPath as IndexPath)
        cell.textLabel?.text = sortedCountyGroupArray[indexPath.section].1[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedCountyGroupArray[section].0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherViewController = WeatherViewController()
        weatherViewController.city = sortedCountyGroupArray[indexPath.section].1[indexPath.row]
        present(weatherViewController, animated: true, completion: nil)
    }
}

extension ViewController:  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var itemWidth: CGFloat {
        get{
            return (collectionView.frame.width / 3) - 10.0
        }
    }
    var itemSize: CGSize {
        get{
            return CGSize(width: itemWidth, height: 44)
        }
    }
    var headerSize: CGSize {
        get{
            return CGSize(width: view.bounds.width, height: CGFloat(55))
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sortedCountyGroupArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedCountyGroupArray[section].1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //🚨I need to refactor this func to reuse the collection view cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        var hasLabelSubview = false
        for subview in cell.subviews {
            if subview.isKind(of: UILabel.self) {
                let label = subview as! UILabel
                label.textAlignment = .center
                label.text = sortedCountyGroupArray[indexPath.section].1[indexPath.row].name
                hasLabelSubview = true
                break
            }
        }
        if !hasLabelSubview {
            let cityNameLabel = UILabel()
            cityNameLabel.text = sortedCountyGroupArray[indexPath.section].1[indexPath.row].name
            cell.addSubview(cityNameLabel)
            cityNameLabel.frame = cell.bounds
            cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
    //Section Header View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //🚨I need to refactor this func to reuse the header view
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? UICollectionReusableView {
            var hasHeaderSubview = false
            for subview in sectionHeader.subviews {
                if subview.isKind(of: UILabel.self) {
                    let label = subview as! UILabel
                    label.textAlignment = .center
                    label.text = sortedCountyGroupArray[indexPath.section].0
                    hasHeaderSubview = true
                    break
                }
            }
            if !hasHeaderSubview {
                let sectionHeaderlabel = UILabel()
                sectionHeaderlabel.text = sortedCountyGroupArray[indexPath.section].0
                sectionHeader.addSubview(sectionHeaderlabel)
                sectionHeaderlabel.translatesAutoresizingMaskIntoConstraints = false
                sectionHeaderlabel.centerXAnchor.constraint(equalTo: sectionHeader.centerXAnchor).isActive = true
                sectionHeaderlabel.centerYAnchor.constraint(equalTo: sectionHeader.centerYAnchor).isActive = true
                sectionHeaderlabel.topAnchor.constraint(equalTo: sectionHeader.topAnchor).isActive = true
                sectionHeaderlabel.leadingAnchor.constraint(equalTo: sectionHeader.leadingAnchor).isActive = true
            }
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    //Section Header View Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return headerSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherViewController = WeatherViewController()
        weatherViewController.city = sortedCountyGroupArray[indexPath.section].1[indexPath.row]
        present(weatherViewController, animated: true, completion: nil)
    }
}

