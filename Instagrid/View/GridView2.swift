//
//  GridView2.swift
//  Instagrid
//
//  Created by Mehdi on 11/01/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class GridView2: GridView {

    //-MARK: Properties
    //Content view
    @IBOutlet var contentGridView2: UIView!
    
    //Buttons
    //Top
    @IBOutlet weak var topQuarterLeftImg: UIImageView!
    @IBOutlet weak var topQuarterRightImg: UIImageView!
    //Bottom
    @IBOutlet weak var bottomHalfImg: UIImageView!
    
    
    //-MARK: Methods
    override func xibSetup() {
        
        contentGridView2 = loadFromNib()
        
        contentGridView2.frame = bounds
        
        contentGridView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentGridView2)
        
    }

}
