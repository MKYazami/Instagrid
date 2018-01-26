//
//  ShareGrid.swift
//  Instagrid
//
//  Created by Mehdi on 23/01/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Foundation
import UIKit

/// Allows to transform a uiview to an image
class ViewToImage {
    
    //-MARK: Methods
    static func transformViewToImage(view: GridView) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let imageToShare = renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        return imageToShare
    }
    

}
