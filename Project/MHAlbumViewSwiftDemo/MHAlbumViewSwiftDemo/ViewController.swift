//
//  ViewController.swift
//  MHAlbumViewSwiftDemo
//
//  Created by Martin Hartl on 28/07/14.
//  Copyright (c) 2014 Martin Hartl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var albumView1: MHAlbumView!
    @IBOutlet weak var albumView2: MHAlbumView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.albumView1.tapInsideActionBlock = { image, tapGestureRecognizer in
            println("tap inside fired")
        }
    }

    @IBAction func setFirstImage(sender: AnyObject) {
        self.albumView1.image = UIImage(named: "image.jpg")
    }

    @IBAction func setSecondImage(sender: AnyObject) {
        self.albumView2.image = UIImage(named: "image2.jpg")
    }
}

