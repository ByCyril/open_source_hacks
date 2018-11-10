//
//  ViewController.swift
//  CustomCamera
//
//  Created by Cyril Garcia on 9/19/18.
//  Copyright © 2018 Cyril Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CameraDelegate {
    let camera = CameraController()

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.camera.delegate = self

    }
    
    @IBAction func showCamera() {
        self.present(self.camera, animated: true, completion: nil)
    }
    
 
    func getImage(_ image: UIImage) {
        self.imageView.image = image
    }
    
    
}
