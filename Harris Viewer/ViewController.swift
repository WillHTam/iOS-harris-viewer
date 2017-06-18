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
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // instead of retyping argument, use underscore to automatically use the argument entered
        // this function creates as many table rows as there are pictures
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // recycle cells into reuse queue
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // set 'Picture' as the identifier of the cell type we want to reuse
        cell.textLabel?.text = pictures[indexPath.row]
        // will use the name of the picture from the array and put it into the cell's text label
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // instantiateViewController automatically returns UIViewController, so we have to typecast it
            // 2: Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // the 'if let' above has three checks 1) ? which would stop if storyboard were nil 2) instantiateViewController would fail if it called an invalid Identifier and 3) as? would fail if a different type of view controller were received
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

