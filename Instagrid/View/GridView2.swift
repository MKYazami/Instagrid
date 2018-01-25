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
    @IBOutlet weak var topLeftImg: UIImageView!
    @IBOutlet weak var topRightImg: UIImageView!
    //Bottom
    @IBOutlet weak var bottomImg: UIImageView!
    
    
    //-MARK: Methods
    override func xibSetup() {
        
        contentGridView2 = loadFromNib()
        
        contentGridView2.frame = bounds
        
        contentGridView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentGridView2)
        
    }
    
    /// Reset the grid images as when the application started
    func resetGridView2() {
        topLeftImg.image = #imageLiteral(resourceName: "Quarter Add Image")
        topRightImg.image = #imageLiteral(resourceName: "Quarter Add Image")
        bottomImg.image = #imageLiteral(resourceName: "Half Add Image")
    }
}
