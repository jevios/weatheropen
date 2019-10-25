//
//  NavigationBar.swift
//  weatheropen
//
//  Created by Bohdan Yankivskyi on 8/16/19.
//  Copyright © 2019 by. All rights reserved.
//

import UIKit

class NavigationBar: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    var isBackButtonHidden: Bool = false {
        didSet {
            backButton.isHidden = isBackButtonHidden
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Common
    private func commonInit() {
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}
