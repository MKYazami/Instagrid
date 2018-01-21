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
    @IBOutlet weak private var gridConfigurator1: UIImageView!
    @IBOutlet weak private var gridConfigurator2: UIImageView!
    @IBOutlet weak private var gridConfigurator3: UIImageView!
    
    @IBOutlet weak private var gridView: GridView!
    @IBOutlet weak private var swipeView: UIView!
    @IBOutlet weak private var swipeLabel: UILabel!
    
    //The swipe gesture to share the grid as gloabal variable to get up or left direction
    private var swipeGestureRecognizer: UISwipeGestureRecognizer?
    
    //Instance of UIImagePickerController to pick the image from photo library
    fileprivate let imageToPick = UIImagePickerController()
    
    //Intermediate variable between the library and the grid images
    fileprivate var imageFromLibraryToGridImages: UIImage?
    
    //Allow to know from which grid config the tap gesture is did
    fileprivate var gridConfig: GridConfig = .grid2
    
    
    ///Will stock the tap gesture from grid images
    fileprivate var tapGesture: UITapGestureRecognizer?
    
    //==============================
    //Instance of GridView1, 2 & 3 =
    //==============================
    //Get the nib 1 to load in grid
    fileprivate let viewLoadedInGrid1 = GridView1()
    
    //Get the nib 2 to load in grid
    fileprivate let viewLoadedInGrid2 = GridView2()
    
    //Get the nib 3 to load in grid
    fileprivate let viewLoadedInGrid3 = GridView3()
    //==============================
    //                             =
    //==============================
    
    //-MARK: Enumation
    
    ///Enumaring the grid configuration
    fileprivate enum GridConfig {
        case grid1
        case grid2
        case grid3
    }
    
    
    //-MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get tap gestures for grid configurators
        getTapGridConfigurator()
        
        getSwipeGesture()
        
        //Set ViewController as delegate for the UIImagePickerController
        imageToPick.delegate = self
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
        //Change here for the grid problem in iPhone X
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
    
    /// Bring back the grid and swipe views to initial position
    private func bringBackViews() {
        //Get translations
        let translation = CGAffineTransform(translationX: 0.0, y: 0.0)
        let scaleTranslation = CGAffineTransform(scaleX: 1.0, y: 1.0)
        let finalTranslation = translation.concatenating(scaleTranslation)
        
        UIView.animate(withDuration: 0.7, animations: {
            self.gridView.transform = finalTranslation
            self.swipeView.transform = finalTranslation
        }) 
    }
    
    private func shareGrid() {
        //Action to share (Will transform grid in image to share)
        
        bringBackViews()
        
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
        setupGridConfigurator1()
        setupGridConfig1()
    }
    
    //Set up grid and gridConfigurator in config 2
    @objc private func setConfig2() {
        setupGridConfigurator2()
        setupGridConfig2()
    }
    
    //Set up grid and gridConfigurator in config 3
    @objc private func setConfig3() {
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
        viewLoadedInGrid1.frame = gridView.bounds
        
        //Add gestures to the images that allow to make picture selection
        viewLoadedInGrid1.topImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid1(gesture:))))
        
        viewLoadedInGrid1.bottomLeftImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid1(gesture:))))
        
        viewLoadedInGrid1.bottomRightImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid1(gesture:))))
        
        //Add xib in grid view
        gridView.addSubview(viewLoadedInGrid1)
    }
    
    //Set up the grid view in configuration 2
    private func setupGridConfig2() {
        //Get the nib loaded in grid
        viewLoadedInGrid2.frame = gridView.bounds
        
        //Add gestures to the images that allow to make picture selection
        viewLoadedInGrid2.topLeftImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid2(gesture:))))
        
        viewLoadedInGrid2.topRightImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid2(gesture:))))
        
        viewLoadedInGrid2.bottomImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid2(gesture:))))
        
        //Add xib in grid view
        gridView.addSubview(viewLoadedInGrid2)
    }
    
    //Set up the grid view in configuration 3
    private func setupGridConfig3() {
        viewLoadedInGrid3.frame = gridView.bounds
        
        //Add gestures to the images that allow to make picture selection
        viewLoadedInGrid3.topLeftImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid3(gesture:))))
        
        viewLoadedInGrid3.topRightImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid3(gesture:))))
        
        viewLoadedInGrid3.bottomLeftImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid3(gesture:))))
        
        viewLoadedInGrid3.bottomRightImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFromGrid3(gesture:))))
        
        //Add xib in grid view
        gridView.addSubview(viewLoadedInGrid3)
    }
    
    //=========================================
    //End methods set the grid configuration .\
    //=========================================
    
    /// Transfer the tap gesture and affect .grid1 to gridConfig
    ///
    /// - Parameter gesture: The tap gesture to tranfer and get the tag of the grid image
    @objc private func tapFromGrid1(gesture: UITapGestureRecognizer) {
        gridConfig = .grid1
        photoLibraryAccess(gesture: gesture)
    }
    
    /// Transfer the tap gesture and affect .grid2 to gridConfig
    ///
    /// - Parameter gesture: The tap gesture to tranfer and get the tag of the grid image
    @objc private func tapFromGrid2(gesture: UITapGestureRecognizer) {
        gridConfig = .grid2
        photoLibraryAccess(gesture: gesture)
    }
    
    /// Transfer the tap gesture and affect .grid3 to gridConfig
    ///
    /// - Parameter gesture: The tap gesture to tranfer and get the tag of the grid image
    @objc private func tapFromGrid3(gesture: UITapGestureRecognizer) {
        gridConfig = .grid3
        photoLibraryAccess(gesture: gesture)
    }
    
    
    /// Determine from which grid the tap gesture was done
    ///
    /// - Parameter gesture: The tap gesture to tranfer and get the tag of the grid image
    fileprivate func affectImageToGrid(gesture: UITapGestureRecognizer) {
        switch gridConfig {
        case .grid1:
            affectImageToGrid1(gesture: gesture)
        case .grid2:
            affectImageToGrid2(gesture: gesture)
        case .grid3:
            affectImageToGrid3(gesture: gesture)
        }
    }
    
    /// Determine from which grid 1 image the tap gesture wase done
    ///
    /// - Parameter gesture: The tap gesture to get the tag of the grid image
    private func affectImageToGrid1(gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        switch tag {
        case 1:
            viewLoadedInGrid1.topImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        case 2:
            viewLoadedInGrid1.bottomLeftImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        case 3:
            viewLoadedInGrid1.bottomRightImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        default:
            break
        }
    }
    
    /// Determine from which grid 2 image the tap gesture wase done
    ///
    /// - Parameter gesture: The tap gesture to get the tag of the grid image
    private func affectImageToGrid2(gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        switch tag {
        case 1:
            viewLoadedInGrid2.topLeftImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        case 2:
            viewLoadedInGrid2.topRightImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        case 3:
            viewLoadedInGrid2.bottomImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        default:
            break
        }
    }
    
    /// Determine from which grid 3 image the tap gesture wase done
    ///
    /// - Parameter gesture: The tap gesture to get the tag of the grid image
    private func affectImageToGrid3(gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        switch tag {
        case 1:
            viewLoadedInGrid3.topLeftImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        case 2:
            viewLoadedInGrid3.topRightImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        case 3:
            viewLoadedInGrid3.bottomLeftImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        case 4:
            viewLoadedInGrid3.bottomRightImg.image = imageFromLibraryToGridImages
            imageFromLibraryToGridImages = nil
        default:
            break
        }
    }
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
     fileprivate func photoLibraryAccess(gesture: UITapGestureRecognizer) {
        //Check if the photo library source is available
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("Error: Impossible to have access to photo library!")
            return
        }
        
        //Affect photo library to source type
        imageToPick.sourceType = .photoLibrary
        //Deny the image editing
        imageToPick.allowsEditing = false
        
        //Present the image picker view controller in modal view
        present(imageToPick, animated: true, completion: nil)
        
        //Affect the  tap gesture from grid image to gesture variable to know which image was tapped
        tapGesture = gesture
    }
    
    //When user access to the photo library to pick image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        defer {
            picker.dismiss(animated: true, completion: nil)
        }
        
        //Getting image from photo library
        guard let imageFromLibrary = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        
        //Affecting the image to imageFromLibraryToGridImages which is a global variable to use it later
        imageFromLibraryToGridImages = imageFromLibrary
        
        //Call this method that determines from which grid the tap gesture was done
        affectImageToGrid(gesture: tapGesture!)
    }
    
    //When the user cancels the action
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        defer {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

