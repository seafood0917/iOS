//
//  CameraViewModel.swift
//  SwiftCamera
//
//  Created by Daesik Choi on 3/22/21.
//

import Foundation
import Combine
import AVFoundation
import SwiftUI

// Using MVVM. It's a View Model of CameraService.
final class CameraViewModel: ObservableObject {
    private let service = CameraService()
    @Published var photo: Photo!
    @Published var showAlertError = false
    @Published var isFlashOn = false
    var alertError: AlertError!
    var session: AVCaptureSession
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.session = service.session
        service.$photo.sink { [weak self] (photo) in
            guard let pic = photo else { return }
            self?.photo = pic
        }
        .store(in: &self.subscriptions)
        
        service.$shouldShowAlertView.sink { [weak self] (val) in
            self?.alertError = self?.service.alertError
            self?.showAlertError = val
        }
        .store(in: &self.subscriptions)
    }
    
    func configure() {
        service.checkForPermissions()
        service.configure()
    }
    
    func capturePhoto() {
        service.capturePhoto()
    }
    
    func flipCamera() {
        service.changeCamera()
    }
    
    func zoom(with factor: CGFloat) {
        service.set(zoom: factor)
    }
    
    func switchFlash() {
        service.flashMode = service.flashMode == .on ? .off : .on
    }
}
