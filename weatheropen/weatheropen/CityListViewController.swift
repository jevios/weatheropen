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
    
    // MARK: - Private Functions
    // MARK: - TableViews
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CityCell.nib, forCellReuseIdentifier: CityCell.identifier)
        tableView.reloadData()
    }
    
    // MARK: - SetUp Array
    private func createArray() {
        cities.removeAll()
        cities.append(City(name: "Shanghai"))
        cities.append(City(name: "Beijing"))
        cities.append(City(name: "Karachi"))
        cities.append(City(name: "Istanbul"))
        cities.append(City(name: "Dhaka"))
        cities.append(City(name: "Tokyo"))
        cities.append(City(name: "Moscow"))
        cities.append(City(name: "Manila"))
        cities.append(City(name: "Tianjin"))
        cities.append(City(name: "Mumbai"))
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.red
        let sectionTitle = UILabel()
        sectionTitle.text = "The 10 Largest Cities In The World!!!"
        sectionTitle.textColor = .white
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.lineBreakMode = .byWordWrapping
        sectionTitle.numberOfLines = 0
        sectionTitle.textAlignment = .center
        headerView.addSubview(sectionTitle)
        sectionTitle.widthAnchor.constraint(equalTo: headerView.widthAnchor).isActive = true
        sectionTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        sectionTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        return headerView
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





