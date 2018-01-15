//
//  ViewController.swift
//  Instagrid
//
//  Created by Mehdi on 10/01/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //-MARK: Properties
    //Images that allow to change the grid configuration
    @IBOutlet weak var gridConfigurator1: UIImageView!
    @IBOutlet weak var gridConfigurator2: UIImageView!
    @IBOutlet weak var gridConfigurator3: UIImageView!
    
    @IBOutlet weak var gridView: GridView!
    
    
    //General tag
    var tag: Int?
    
    
    
    //-MARK: Methods
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getTapGridConfigurator()
    }
    
    //================================================================
    //Changing the grid configuration depending of the tapped images\\
    //================================================================
    
    //Get the tap gesture from the grid configurators images
    private func getTapGridConfigurator() {
        //Get gesture for the gridConfigurator1
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(setConfig1))
        gridConfigurator1.addGestureRecognizer(tapGesture1)
        
        //Get gesture for the gridConfigurator2
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(setConfig2))
        gridConfigurator2.addGestureRecognizer(tapGesture2)
        
        //Get gesture for the gridConfigurator3
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(setConfig3))
        gridConfigurator3.addGestureRecognizer(tapGesture3)
    }
    
    
    //Set up grid and gridConfigurator in config 1
    @objc private func setConfig1() {
        print("Tap Gesture1")
        setupGridConfigurator1()
        setupGridConfig1()
    }
    
    //Set up grid and gridConfigurator in config 2
    @objc private func setConfig2() {
        print("Tap Gesture2")
        setupGridConfigurator2()
        setupGridConfig2()
    }
    
    //Set up grid and gridConfigurator in config 3
    @objc private func setConfig3() {
        print("Tap Gesture3")
        setupGridConfigurator3()
        setupGridConfig3()
    }
    
    
    //========================================
    // Methods set up the gridConfigurator  \\
    //========================================
    
    //Set up the gridConfigurator view in configuration 1
    private func setupGridConfigurator1() {
        gridConfigurator1.image = UIImage(named: "Layout 1 Selected")
        
        gridConfigurator2.image = UIImage(named: "Layout 2")
        
        gridConfigurator3.image = UIImage(named: "Layout 3")
    }
    
    //Set up the gridConfigurator view in configuration 2
    private func setupGridConfigurator2() {
        gridConfigurator1.image = UIImage(named: "Layout 1")
        
        gridConfigurator2.image = UIImage(named: "Layout 2 Selected")
        
        gridConfigurator3.image = UIImage(named: "Layout 3")
    }
    
    //Set up the gridConfigurator view in configuration 3
    private func setupGridConfigurator3() {
        gridConfigurator1.image = UIImage(named: "Layout 1")
        
        gridConfigurator2.image = UIImage(named: "Layout 2")
        
        gridConfigurator3.image = UIImage(named: "Layout 3 Selected")
    }
    
    //===========================================
    //End methods set up the gridConfigurator  .\
    //===========================================
    
    
    //=========================================
    // Methods set up the grid configuration \\
    //=========================================
    
    //Set up the grid view in configuration 1
    private func setupGridConfig1() {
        //Get the nib loaded in grid
        let viewLoadedInGrid = GridView1(frame: gridView.bounds)
        
        //Add gestures to the images that allow to make picture selection
        viewLoadedInGrid.topImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        viewLoadedInGrid.bottomLeftImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        viewLoadedInGrid.bottomRightImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        //Add xib in grid view
//        gridView.addSubview(viewLoadedInGrid)
    }
    
    //Set up the grid view in configuration 2
    private func setupGridConfig2() {
        //Get the nib loaded in grid
        let viewLoadedInGrid = GridView2(frame: gridView.bounds)
        
        //Add gestures to the images that allow to make picture selection
        viewLoadedInGrid.topLeftImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        viewLoadedInGrid.topRightImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        viewLoadedInGrid.bottomImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        //Add xib in grid view
//        gridView.addSubview(viewLoadedInGrid)
    }
    
    //Set up the grid view in configuration 3
    private func setupGridConfig3() {
        //Get the nib loaded in grid
        let viewLoadedInGrid = GridView3(frame: gridView.bounds)
        
        //Add gestures to the images that allow to make picture selection
        viewLoadedInGrid.topLeftImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        viewLoadedInGrid.topRightImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        viewLoadedInGrid.bottomLeftImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        viewLoadedInGrid.bottomRightImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageFromLibrary)))
        
        //Add xib in grid view
//        gridView.addSubview(viewLoadedInGrid)
    }
    
    //=========================================
    //End methods set the grid configuration .\
    //=========================================
    
    @objc private func selectImageFromLibrary() {
        print("Tap Working")
        accessPhotoLibrary()
        
    }
    
    private func accessPhotoLibrary() {
        
    }
}

