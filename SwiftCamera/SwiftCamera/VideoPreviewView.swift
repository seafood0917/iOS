//
//  VideoPreviewView.swift
//  SwiftCamera
//
//  Created by Daesik Choi on 3/22/21.
//

import SwiftUI
import AVFoundation

// To pass the CameraService capture session data to our view in SwiftUI. For this we'll need to create a special view that conforms to the UIViewRepresentable protocol.
struct CameraPreview: UIViewRepresentable {
    // 1. create a UIView subclass that overrides the UIView's layer type and sets it to AVCaptureVideoPreviewLayer
    class VideoPreviewView: UIView {
        override class var layerClass: AnyClass {
            AVCaptureVideoPreviewLayer.self
        }
    // Then we create a new get-only property named videoPreviewLayer that returns the UIView's layer cast as AVCaptureVideoPreviewLayer.
    // This way we can use this newly created view, VideoPreviewView, in SwiftUI and set its frame and size as we like using the .frame() view modifiers, w/o the need to be passing a CGRect frame in the VideoPreviewView init to modify manually the video preview layer, as I've seen in other solutions in the community.
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            return layer as! AVCaptureVideoPreviewLayer
        }
    }
    
    // 2. Declare a dependency on a AVCaptureSession property to be provided by CameraService, and we use this session to set it as the AVCaptureViewPreviewLayer's session so the video preview layer can output what the camera is capturing.
    let session: AVCaptureSession
    
    // 3. There are two methods that the UIViewRepresentable protocol provides, makeUIView() and updateUIView().
    // As of now, we only need makeUIView() to return our view. Here we'll init an instance of our just created VideoPreviewView and add some configuration.
    func makeUIView(context: Context) -> VideoPreviewView {
        let view = VideoPreviewView()
        view.backgroundColor = .black
        view.videoPreviewLayer.cornerRadius = 0
        view.videoPreviewLayer.session = session
        view.videoPreviewLayer.connection?.videoOrientation = .portrait
        
        return view
    }
    
    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
        
    }
}
