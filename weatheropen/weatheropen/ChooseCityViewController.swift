//
//  ChooseCityViewController.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 10/25/19.
//  Copyright © 2019 by. All rights reserved.
//

import UIKit

// MARK: ChooseCityDelegate Protocol
protocol ChooseCityDelegate {
    func userEnteredANewCityName(city: String)
}


class ChooseCityViewController: UIViewController {
    
    // MARK: Properties
    var delegate : ChooseCityDelegate?
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    //MARK: IBOutlets
    @IBOutlet weak var changeCityTextField: UITextField!
    
    //MARK: IBActions
    @IBAction func getWeatherPressed(_ sender: AnyObject) {        
        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
