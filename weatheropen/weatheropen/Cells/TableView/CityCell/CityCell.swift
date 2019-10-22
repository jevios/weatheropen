//
//  CityCell.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    // MARK: Properties
    static let identifier = String(describing: CityCell.self)
    static let nib = UINib(nibName: String(describing: CityCell.self), bundle: nil)
    
    
    //MARK: IBOutlets
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func select() {
        cityLabel.textColor = .white
    }
    
    func deselect() {
        cityLabel.textColor = .black
    }

    //MARK: Configure Cell
    func configure(with city: City) {
        cityLabel.text = city.name
    }
    
}
