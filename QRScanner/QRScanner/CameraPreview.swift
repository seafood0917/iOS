//
//  CameraPreview.swift
//  QRScanner
//
//  Created by Daesik Choi on 3/24/21.
//

import SwiftUI
import UIKit
import AVFoundation


// This is the UIView we are going to use to show a live feed from the camera(or a simulated value for the simulator). This is a UIKit view which will eventually be presented using a UIViewRepresentable in our SwiftUI layout.
// The view is created for a given AVCaptureSession and includes a AVCaptureVideoPreviewLayer which is based on CoreAnimation and enables us to preview the visual output from the camera session. This is what the user will eventually see as a “camera preview”. When the camera is not available, we are going to substitute the vide preview with a simple UILabel showing the mock data content we’ve provided.


class CameraPreview: UIView {
    private var label: UILabel?
    
    var previewLayer: AVCaptureVideoPreviewLayer?
    var session = AVCaptureSession()
    weak var delegate: QrCodeCameraDelegate?
    
    init(session: AVCaptureSession) {
        super.init(frame: .zero)
        self.session = session
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSimulatorView(delegate: QrCodeCameraDelegate) {
        self.delegate = delegate
        self.backgroundColor = UIColor.black
        label = UILabel(frame: self.bounds)
        label?.numberOfLines = 4
        label?.text = "Click here to simulate scan"
        label?.textColor = UIColor.white
        label?.textAlignment = .center
        if let label = label {
            addSubview(label)
        }
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onClick))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func onClick(){
        delegate?.onSimulateScanning()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        #if targetEnvironment(simulator)
            label?.frame = self.bounds
        #else
            previewLayer?.frame = self.bounds
        #endif
    }
}
