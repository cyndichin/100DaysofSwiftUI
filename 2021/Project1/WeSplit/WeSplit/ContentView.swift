//
//  ContentView.swift
//  WeSplit
//
//  Created by cynber on 1/21/21.
//  Copyright © 2021 cyndichin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople) ?? 1
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let total = orderAmount + tipValue
        return total
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
//                Picker("Number of people", selection: $numberOfPeople) {
//                    ForEach(2..<100) {
//                        Text("\($0) people")
//                    }
//                }
                
                TextField("Number of people", text: $numberOfPeople)
                    .keyboardType(.decimalPad)

                Section(header: Text("Total Check")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
