//
//  GridView.swift
//  Instagrid
//
//  Created by Mehdi on 11/01/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class GridView: UIView {

    //-MARK: Inits
    
    //Init for custom view in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        
    }
    
    //Init for custom view in Interface builder for the storyboard & xib files
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        
    }
    
    //-MARK: Methods
    /// Load view from nib
    ///
    /// - Returns: The view from nib
    internal func loadFromNib() -> UIView! {
        //Get bundle
        let bundle = Bundle(for: type(of: self))
        
        //Get the nib from bundle
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        
        //Get the grid view from nib to return
        //Unwrap gridView as UIView, because instantiate() returns [Any]
        let gridView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return gridView
    }
    
    /// Setup the nib view
    internal func xibSetup() {}

}
