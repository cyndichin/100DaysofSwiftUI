//
//  ContentView.swift
//  ChallengeDay19
//
//  Created by cynber on 1/24/21.
//  Copyright © 2021 cyndichin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var units = ["milliliters", "liters", "cups", "pints", "gallons"]
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    var convertedAmount: Double {
        let value = Double(amount) ?? 0
        // convert input to milliliters
        let liters = Measurement(value: value, unit: UnitVolume.liters).converted(to: .milliliters).value
        let cups = Measurement(value: value, unit: UnitVolume.cups).converted(to: .milliliters).value
        let pints = Measurement(value: value, unit: UnitVolume.pints).converted(to: .milliliters).value
        let gallons = Measurement(value: value, unit: UnitVolume.gallons).converted(to: .milliliters).value
        let convertToMilliliters = [value, liters, cups, pints, gallons]
        
        // convert from milliliters to output
        let milliliters = Measurement(value: convertToMilliliters[inputUnit], unit: UnitVolume.milliliters)
        let outputLiters = milliliters.converted(to: .liters).value
        let outputCups = milliliters.converted(to: .cups).value
        let outputPints = milliliters.converted(to: .pints).value
        let outputGallons = milliliters.converted(to: .gallons).value
        
        let outputConversion = [milliliters.value, outputLiters, outputCups, outputPints, outputGallons]
        
        return outputConversion[outputUnit]
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            Section {
                Picker("Input Unit", selection: $inputUnit) {
                    ForEach(0 ..< units.count) {
                        Text("\(self.units[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section {
                Picker("Output Unit", selection: $outputUnit) {
                    ForEach(0 ..< units.count) {
                        Text("\(self.units[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section {
                Text("\(convertedAmount, specifier: "%.5f") \(units[outputUnit])")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
