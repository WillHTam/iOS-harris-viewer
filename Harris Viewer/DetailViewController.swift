//
//  DetailViewController.swift
//  Harris Viewer
//
//  Created by William on 18/6/17.
//  Copyright © 2017 Will Works Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
// Create a screen of data called ViewController, based on UIViewController
// types that start with UI come from UIKit
// Changed to UITableViewController which provides the functionality to show rows of data that can be scrolled and selected. i.e. Settings
    
    @IBOutlet weak var imageView: UIImageView!
    // fm, path, and items below live inside viewDidLoad() and thus will be destroyed when the method finishes. So we want to attach data to ViewContoller so that it will persist
    // this line created by ctrl+dragging from storyboard
    // we need to use the image view inside code by creating a property that is attached to the layout
    // hover over the grey circle to the left
    // IBOutlet: there is a connection between this code and Interface Builder
    // weak: don't own this object in memory, the view owns it
    // imageView: the property name assigned to this UIIMageView
    // UIImageView!: declares property to be of type UIImageView, and then implicitly unwrapped
    
    var selectedImage: String?
    // hold the name of the image to load
    
    override func viewDidLoad() {
    // 'override' necessary to override the default Apple UIViewController
    // called when the screen has loaded
        
        super.viewDidLoad()
        // super means to tell UIViewController to run its own code before running mine
        title = selectedImage
        // set the title of the view to the image name
        
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
        // if let unwraps the option in selectedImage
        // if it has a value (which it always will and thus the ? will not fail), it will be placed in imageToLoad and then passed to UIImage and laoded
    }
    
    
    // below, tap to make the menu bar disappear if the image is tapped
    // need to modify the hidesBarsOnTap property so that it is only true when the detail view cotnroller is showing
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
