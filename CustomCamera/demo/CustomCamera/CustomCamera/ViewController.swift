//
//  ViewController.swift
//  CustomCamera
//
//  Created by Cyril Garcia on 9/19/18.
//  Copyright © 2018 Cyril Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CameraDelegate {
    
    var camera: CameraController!
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    @IBAction func showCamera() {
        self.camera = CameraController()
        self.camera.delegate = self
        self.present(self.camera, animated: true, completion: nil)
    }
    
    func getImageData(_ image: UIImage) {
        print("Image:",image)
        self.imageView.image = image
    }
    
    
}
