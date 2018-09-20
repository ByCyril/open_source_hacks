//
//  ViewController.swift
//  CustomCamera
//
//  Created by Cyril Garcia on 9/19/18.
//  Copyright © 2018 Cyril Garcia. All rights reserved.
//

import UIKit

protocol CameraDelegate {
    func getImageData(_ image: UIImage)
}

class CameraController: UIViewController {
  
    private var camera: Camera!
    private var cancelButton: UIButton!
    private var captureButton: UIButton!
    
    public var delegate: CameraDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCamera()
        self.setupButtons()
        self.addButtonsToSubView()
    }
    
    private func setupCamera() {
        self.camera = Camera(self)
        self.camera.preview(frame: self.view.frame)
        
        self.view.layer.addSublayer(self.camera.setup_camera())
        
        self.camera.startCaptureSession()
    }
    
    private func setupButtons() {
        self.cancelButton = {
            let button = self.button("Cancel")
            button.frame.size = CGSize(width: 100, height: 35)
            button.center = CGPoint(x: self.view.frame.size.width / 6, y: self.view.frame.size.height * 0.15)
            button.addTarget(self, action: #selector(CameraController.cancel), for: .touchUpInside)
            return button
        }()
        
        self.captureButton = {
            let button = self.button("Capture")
            button.frame.size = CGSize(width: 100, height: 35)
            button.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height * 0.80)
            button.addTarget(self, action: #selector(CameraController.capture), for: .touchUpInside)
            return button
        }()
    }
    
    private func addButtonsToSubView() {
        self.view.addSubview(self.cancelButton)
        self.view.addSubview(self.captureButton)
    }
    
    private func button(_ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.zPosition = 5
        return button
    }
    
    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func capture() {
        self.delegate.getImageData(self.camera.getImage())
        self.dismiss(animated: true, completion: nil)
    }
    
  

}

