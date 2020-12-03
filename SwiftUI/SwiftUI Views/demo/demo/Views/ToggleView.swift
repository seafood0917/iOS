//
//  DatePickerToggle.swift
//  demo
//
//  Created by Bigluck on 2020/12/03.
//

import SwiftUI

struct ToggleView: View {
    var isActivatedMessage: String {
        return "CatNip is " + (isActivated ? "activated!" : "deactivated")
    }
    @State var isActivated = false
    var body: some View {
        VStack {
            Toggle("Activate Cat Nip!", isOn: $isActivated)
            Text(isActivatedMessage)
                .foregroundColor(isActivated ? .green : .red)
                .fontWeight(isActivated ? .heavy : .regular)
            Toggle(isOn: $isActivated, label: {
                VStack {
                    Image("CatNip")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Activate Catnip!")
                }
            })
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
