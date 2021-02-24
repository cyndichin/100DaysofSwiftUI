//
//  ContentView.swift
//  iExpense
//
//  Created by cynber on 2/20/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        if item.amount > 0 {
                            Text("$\(item.amount)")
                                .modifier(style(amount: item.amount))
                        } else {
                            
                        }
                    }
                }
//                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing:
                                    Button(action: {
                                        //                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                                        //                    self.expenses.items.append(expense)
                                        self.showingAddExpense = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
        }.sheet(isPresented: $showingAddExpense) {
            // show an AddView here
            AddView(expenses: self.expenses)
        }
    }
}


struct style: ViewModifier{
    var amount: Int

    func body(content: Content) -> some View {
        if amount < 10 {
            return content.foregroundColor(.red)
        }

        else if amount < 100 {
            return content.foregroundColor(.green)
        }

        else if amount > 100{
            return content.foregroundColor(.blue)
        }

        else {
            return content.foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
