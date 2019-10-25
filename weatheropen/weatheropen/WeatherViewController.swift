//
//  WeatherViewController.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Properties
    private var condition: WeatherCondition?
    var city: String?
    let APP_ID = "4a401aaf688ec915d989e4b0f9d98a46"

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    // MARK: - ViewController's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWeather(city: city!)
        
    }
    
    // MARK: - Private Functions
    private func getWeather(city: String) {
        ServiceProvider.shared.weather.getWeather(city: city, appID: APP_ID) { [weak self] (result) in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                switch result {
                case .success(let weather):
                    strongSelf.updateUI(with: weather)
                case .failure(let error):
                    strongSelf.presentAlertController(message: error.message, actionHandler: nil)
                }
            }
        }
    }
    
    
    private func updateUI(with weather: Weather) {
        cityLabel.text = weather.name
        let temperature = Int(weather.detail.temperature - 273.15)
        temperatureLabel.text = "\(temperature)°"
        condition = weather.weather.first
        let int = condition?.id
        var icon = condition?.icon
        icon = updateWeatherIcon(condition: int!)
        imageView.image = UIImage(named: icon!)
        
    }
    
    private func updateWeatherIcon(condition: Int) -> String {
        switch (condition) {
        case 0...300 :
            return "tstorm1"
        case 301...500 :
            return "light_rain"
        case 501...600 :
            return "shower3"
        case 601...700 :
            return "snow4"
        case 701...771 :
            return "fog"
        case 772...799 :
            return "tstorm3"
        case 800 :
            return "sunny"
        case 801...804 :
            return "cloudy2"
        case 900...903, 905...1000  :
            return "tstorm3"
        case 903 :
            return "snow5"
        case 904 :
            return "sunny"
        default :
            return "Cloud-Refresh"
        }
        
    }
    
    //MARK: IBActions
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func searchAction(_ sender: UIButton) {
        let chooseCity: ChooseCityViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        chooseCity.delegate = self
        present(chooseCity, animated: true, completion: nil)
        
    }
    
    // BAD PRACTICE //
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "chooseCityName" {
//
//            let destinationVC = segue.destination as! ChooseCityViewController
//
//            destinationVC.delegate = self
//        }
//
//    }
//
}

extension WeatherViewController: ChooseCityDelegate {
    
    func userEnteredANewCityName(city: String) {
        getWeather(city: city)
        
    }
}
