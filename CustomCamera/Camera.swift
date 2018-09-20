//
//  VisionLive.swift
//  VisionLive
//
//  Created by Cyril Garcia on 8/6/18.
//  Copyright © 2018 Cyril Garcia. All rights reserved.
//

import UIKit
import Vision
import AVKit

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}



class Camera: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    private var vc: UIViewController!
    private var captureSession: AVCaptureSession!
    private var previewFrame: CGRect!
    private var pixelBuffer: CVPixelBuffer!
 
    init(_ vc: UIViewController) {
        self.vc = vc
    }
    
    public func preview(frame: CGRect) {
        self.previewFrame = frame
    }
    
    public func startCaptureSession() {
        self.captureSession.startRunning()
    }
    
    public func stopCaptureSession() {
        self.captureSession.stopRunning()
    }
    
    public func getImage() -> UIImage {
        let ciImage = CIImage(cvPixelBuffer: self.pixelBuffer)
        let image = self.convert(ciImage)
        self.stopCaptureSession()
        return image
    }
    
    public func setup_camera() -> AVCaptureVideoPreviewLayer {
        
        if self.previewFrame == nil {
            fatalError("PreviewLayer frame is nil. Call the preview() function.")
        }
        
        self.captureSession = AVCaptureSession()
        
        let input = try? AVCaptureDeviceInput(device: AVCaptureDevice.default(for: .video)!)
        
        self.captureSession.addInput(input!)
        
        let preview_layer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        preview_layer.frame = self.previewFrame

        let data_output = AVCaptureVideoDataOutput()
        data_output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "video_queue"))
        
        self.captureSession.addOutput(data_output)
        
        return preview_layer
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        self.pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
    }
    
    private func convert(_ cImage: CIImage) -> UIImage {
        let context = CIContext.init(options: nil)
        let cgImage = context.createCGImage(cImage, from: cImage.extent)!
        return UIImage.init(cgImage: cgImage)
    }
    
}
