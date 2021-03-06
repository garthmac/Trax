//
//  ViewController.swift
//  Trax
//
//  Created by iMac21.5 on 5/1/15.
//  Copyright (c) 2015 Garth MacKenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sign up to hear about GPX files arriving
        
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        let appDelegate = UIApplication.sharedApplication().delegate
        
        center.addObserverForName(GPXURL.Notification, object: appDelegate, queue: queue) { notification in
            if let url = notification?.userInfo?[GPXURL.Key] as? NSURL {
                self.textView.text = "Received URL = \(url)"
            }
        }
    }
}

