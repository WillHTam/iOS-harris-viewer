//
//  ViewController.swift
//  Harris Viewer
//
//  Created by William T on 18/6/17.
//  Copyright © 2017 Will Works Inc. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // Hold array of picture name strings
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // anything force unwrapped with ! will crash if nil
        // let path gets the location of assets, items gotten from that path
        
        for item in items {
            if item.hasPrefix("harris") {
                // only show Harris pictures
                pictures.append(item)
            }
        }
        
        print(pictures)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

