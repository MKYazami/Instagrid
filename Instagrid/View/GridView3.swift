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
    @IBOutlet weak var topLeftImg: UIImageView!
    @IBOutlet weak var topRightImg: UIImageView!
    //Bottom
    @IBOutlet weak var bottomLeftImg: UIImageView!
    @IBOutlet weak var bottomRightImg: UIImageView!
    
    //-MARK: Methods
    override func xibSetup() {
        
        contentGridView3 = loadFromNib()
        
        //Make superview equal to the view in size
        contentGridView3.frame = bounds
        
        //Allows the contained view to follow the size of the container view when changing size
        contentGridView3.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentGridView3)
        
    }
    
    /// Reset the grid images as when the application started
    func resetGridView3() {
        topLeftImg.image = #imageLiteral(resourceName: "Quarter Add Image")
        topRightImg.image = #imageLiteral(resourceName: "Quarter Add Image")
        bottomLeftImg.image = #imageLiteral(resourceName: "Quarter Add Image")
        bottomRightImg.image = #imageLiteral(resourceName: "Quarter Add Image")
    }

}
