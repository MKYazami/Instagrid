//
//  GridView1.swift
//  Instagrid
//
//  Created by Mehdi on 11/01/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class GridView1: GridView {

    //-MARK: Properties
    //Content view
    @IBOutlet var contentGridView1: UIView!
    
    //Buttons
    //Top
    @IBOutlet weak var topHalfImg: UIImageView!
    //Bottom
    @IBOutlet weak var bottomQuarterLeftImg: UIImageView!
    @IBOutlet weak var bottomQuarterRightImg: UIImageView!
    
    
    //-MARK: Methods
    override func xibSetup() {
        
        contentGridView1 = loadFromNib()
        
        contentGridView1.frame = bounds
        
        contentGridView1.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentGridView1)
        
    }

}
