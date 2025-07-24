//
//  ContentView.swift
//  PastryPocket
//
//  Created by Arman on 24/7/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id:\.self){
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of Cakes: \(order.quantity)",value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Any special request?" , isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section{
                    NavigationLink{
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Pastry Pocket")
        }
    }
}

#Preview {
    ContentView()
}
