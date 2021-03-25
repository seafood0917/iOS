//
//  ContentView.swift
//  QRScanner
//
//  Created by Daesik Choi on 3/24/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ScannerViewModel()
    
    var body: some View {
        ZStack {
            QrCodeScannerView()
            .found(r: self.viewModel.onFoundQrCode)
            .torchLight(isOn: self.viewModel.torchIsOn)
            .interval(delay: self.viewModel.scanInterval)
            
            
            VStack {
                VStack {
                    Text("Keep scanning for QR-codes")
                        .font(.subheadline)
                    if let url = URL(string: self.viewModel.lastQrCode) {
                        Link(self.viewModel.lastQrCode, destination: url)
                            .font(.title)
                            .lineLimit(5)
                            .padding()
                    }
                }
                .padding(.vertical, 20)
                
                Spacer()
                HStack {
                    Button(action: {
                        self.viewModel.torchIsOn.toggle()
                    }, label: {
                        Image(systemName: self.viewModel.torchIsOn ? "bolt.fill" : "bolt.slash.fill")
                            .imageScale(.large)
                            .foregroundColor(self.viewModel.torchIsOn ? Color.yellow : Color.blue)
                            .padding()
                    })
                }
                .background(Color.white)
                .cornerRadius(10)
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
