//
//  ViewController.swift
//  Instagrid
//
//  Created by Mehdi on 10/01/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //-MARK: Properties
    
    //Images that allow to change the grid configuration
    @IBOutlet weak var gridConfigurator1: UIImageView!
    @IBOutlet weak var gridConfigurator2: UIImageView!
    @IBOutlet weak var gridConfigurator3: UIImageView!
    
    @IBOutlet weak var gridView: GridView!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var swipeLabel: UILabel!
    
    //The swipe gesture to share the grid as gloabal variable to get up or left direction
    var swipeGestureRecognizer: UISwipeGestureRecognizer?
    
    
    //-MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get tap gestures for grid configurators
        getTapGridConfigurator()
        
        getSwipeGesture()
    }
    
    // Make default cofiguration when startup the application
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if gridView.subviews.count == 0 {
            setConfig2()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        //Determine the swipe direction and adapt the configuration according to the device orientation
        if UIDevice.current.orientation.isLandscape {
            swipeGestureRecognizer?.direction = .left
            swipeLabel.text = "Swipe left to share"
            
        } else if UIDevice.current.orientation.isPortrait {
            swipeGestureRecognizer?.direction = .up
            swipeLabel.text = "Swipe up to share"
            
        }
    }
    
    /// Allow to get and implemente the gesture to swipe the grid
    private func getSwipeGesture() {
        //Set the swipe gesture recognizer
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeToShare))
        //Unwrap the swipeGestureRecognizer
        guard let swipeGesture = swipeGestureRecognizer else { return }
        //Give default direction to swipe
        swipeGesture.direction = .up
        
        view.addGestureRecognizer(swipeGesture)
    }
    
    //Method in selector of UISwipeGestureRecognizer init
    @objc private func swipeToShare(_ swipe: UISwipeGestureRecognizer) {
        if swipe.state == .ended {
            //Implement condition here to make the good animation
            if swipeGestureRecognizer?.direction == .up {
                moveUp(swipe)
            } else if swipeGestureRecognizer?.direction == .left {
                moveLeft(swipe)
            }
        }
    }
    
    /// Move up the grid and the swipe up view
    private func moveUp(_ swipe: UISwipeGestureRecognizer) {
        //Get translations
        let heightScreen = UIScreen.main.bounds.height
        
        let upTranslation = CGAffineTransform(translationX: 0.0, y: -heightScreen - 500)
        let scaleTranslation = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let finalTranslation = upTranslation.concatenating(scaleTranslation)
        
        UIView.animate(withDuration: 0.7, animations: {
            self.gridView.transform = finalTranslation
            self.swipeView.transform = finalTranslation
        }) { (success) in
            if success {
                self.shareGrid()
            }
        }
        
    }
    
    /// Move left the grid and the swipe left view
    private func moveLeft(_ swipe: UISwipeGestureRecognizer) {
        //Get translations
        let widthScreen = UIScreen.main.bounds.width
        
        let leftTranslation = CGAffineTransform(translationX: -widthScreen - 1000, y: 0.0)
        let scaleTranslation = CGAffineTransform(scaleX: 0.3, y: 0.3)
        let finalTranslation = leftTranslation.concatenating(scaleTranslation)
        
        UIView.animate(withDuration: 0.7, animations: {
            self.gridView.transform = finalTranslation
            self.swipeView.transform = finalTranslation
        }) { (success) in
            if success {
                self.shareGrid()
            }
        }
    }
    
    private func shareGrid() {
        //Action to share (Will transform grid in image to share)
        bringBackViews()
    }
    
    private func bringBackViews() {
        let delay = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.gridView.transform = .identity
            self.swipeView.transform = .identity
        }
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
        gridView.addSubview(viewLoadedInGrid)
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
        gridView.addSubview(viewLoadedInGrid)
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
        gridView.addSubview(viewLoadedInGrid)
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

