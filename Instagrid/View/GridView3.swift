//
//  GridView3.swift
//  Instagrid
//
//  Created by Mehdi on 11/01/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class GridView3: GridView {

    //-MARK: Properties
    //Content view
    @IBOutlet var contentGridView3: UIView!
    
    //Buttons
    //Top
    @IBOutlet weak var topQuarterLeftImg: UIImageView!
    @IBOutlet weak var topQuarterRightImg: UIImageView!
    //Bottom
    @IBOutlet weak var bottomQuarterLeftImg: UIImageView!
    @IBOutlet weak var bottomQuarterRightImg: UIImageView!
    
    //-MARK: Methods
    override func xibSetup() {
        
        contentGridView3 = loadFromNib()
        
        //Make superview equal to the view in size
        contentGridView3.frame = bounds
        
        //Allows the contained view to follow the size of the container view when changing size
        contentGridView3.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentGridView3)
        
    }

}
