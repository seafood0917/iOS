//
//  QrCodeCameraDelegate.swift
//  QRScanner
//
//  Created by Daesik Choi on 3/24/21.
//

import Foundation
import AVFoundation

// The delegate will be responsible for handling the metatdata output, checking if a QR-code was found and informing the parent View of that QR code value.
// Our delegate object will adopt the AVCaptureMetadataOutputObjectsDelegate protocol in order to listen for new metadata objects which were detected in the camera feed.

class QrCodeCameraDelegate: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    var scanInterval: Double = 1.0
    var lastTime = Date(timeIntervalSince1970: 0)
    
    var onResult: (String) -> Void = { _ in }
    var mockData: String?
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            foundBarcode(stringValue)
        }
    }
    
    @objc func onSimulateScanning() {
        foundBarcode(mockData ?? "Simulated QR-code result.")
    }
    
    // As long as the capture session is active and a QR-code image is in view of the camera feed, new metadata objects will be constantly detected. For this, we are going to skip frames and only notify the parent view one per scanning interval.
    func foundBarcode(_ stringValue: String) {
        let now = Date()
        if now.timeIntervalSince(lastTime) >= scanInterval {
            lastTime = now
            self.onResult(stringValue)
        }
    }
    
}
