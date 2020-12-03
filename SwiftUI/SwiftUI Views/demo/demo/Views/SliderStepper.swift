//
//  SliderStepper.swift
//  demo
//
//  Created by Bigluck on 2020/12/03.
//

import SwiftUI

struct SliderStepper: View {
    @State private var orderCount = 0
    @State private var houseTemperature: Double = 0
    var body: some View {
        VStack {
//            Stepper(
//                onIncrement: {
//                    self.orderCount += 1
//                },
//                onDecrement: {
//                    self.orderCount -= 1
//                },
//                label: {
//                    Text("Set order amount")
//                })
            
            Stepper("Count order amount", value: $orderCount)
            
            Text("Current order amount: \(orderCount)")
            
            Slider(value: $houseTemperature, in: (30...120))
            Text("\(houseTemperature)")
        }
    }
}

struct SliderStepper_Previews: PreviewProvider {
    static var previews: some View {
        SliderStepper()
    }
}
