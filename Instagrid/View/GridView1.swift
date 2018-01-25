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
    @IBOutlet weak var topImg: UIImageView!
    //Bottom
    @IBOutlet weak var bottomLeftImg: UIImageView!
    @IBOutlet weak var bottomRightImg: UIImageView!
    
    
    //-MARK: Methods
    override func xibSetup() {
        
        contentGridView1 = loadFromNib()
        
        contentGridView1.frame = bounds
        
        contentGridView1.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentGridView1)
        
    }
    
    /// Reset the grid images as when the application started
    func resetGridView1() {
        topImg.image = #imageLiteral(resourceName: "Half Add Image")
        bottomLeftImg.image = #imageLiteral(resourceName: "Quarter Add Image")
        bottomRightImg.image = #imageLiteral(resourceName: "Quarter Add Image")
    }

}
