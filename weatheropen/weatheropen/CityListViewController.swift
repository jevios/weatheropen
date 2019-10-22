//
//  CityListViewController.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Properties
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    var cities: [City] = []

    // MARK: - ViewController's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        createArray()
    }
    
    
    // MARK: - TableViews
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CityCell.nib, forCellReuseIdentifier: CityCell.identifier)
        tableView.reloadData()
    }
    
    // MARK: - SetUp Array
    func createArray() {
        cities.removeAll()
        cities.append(City(name: "Kyiv"))
        cities.append(City(name: "Odesa"))
        cities.append(City(name: "Kharkiv"))
        cities.append(City(name: "Dnipro"))
        cities.append(City(name: "Donetsk"))
        cities.append(City(name: "Zaporizhia"))
        cities.append(City(name: "Lviv"))
        cities.append(City(name: "Kryvyi Rih"))
        cities.append(City(name: "Rivne"))
        cities.append(City(name: "Mariupol"))
        cities.append(City(name: "Mykolaiv"))
        cities.append(City(name: "Texas"))
        cities.append(City(name: "California"))
        cities.append(City(name: "Nagoya"))
        cities.append(City(name: "Noshiro"))
        cities.append(City(name: "Nebraska"))
        cities.append(City(name: "Seiyo"))
        cities.append(City(name: "Alaska"))
        cities.append(City(name: "Wisconsin Dells"))
        cities.append(City(name: "New York"))
        cities.append(City(name: "Zimbabwe"))
        cities.append(City(name: "Chicago"))
        cities.append(City(name: "Tokyo"))
        cities.append(City(name: "Astana"))
        cities.append(City(name: "Ulaanbaatar"))
        cities.append(City(name: "Yakutsk"))
        cities.append(City(name: "Tomisato"))
        cities.append(City(name: "Sakura"))
    }
}


// MARK: - UITableViewDataSource
extension CityListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.identifier) as! CityCell
        cell.configure(with: cities[indexPath.row])
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CityListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let weatherVC: WeatherViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        let city = cities[indexPath.row]
        weatherVC.city = city.name
        navigationController?.pushViewController(weatherVC, animated: true)
    }
    
}





