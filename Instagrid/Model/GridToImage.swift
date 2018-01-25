//
//  ShareGrid.swift
//  Instagrid
//
//  Created by Mehdi on 23/01/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Foundation
import UIKit

class GridToImage {
    
    //-MARK: Properties
    private var gridView: GridView
    
    
    //-MARK: Init
    init(gridView: GridView) {
        self.gridView = gridView
    }
    
    //-MARK: Methods
    func transformGridViewToImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: gridView.bounds.size)
        let imageToShare = renderer.image { _ in
            gridView.drawHierarchy(in: gridView.bounds, afterScreenUpdates: true)
        }
        return imageToShare
    }
    

}
