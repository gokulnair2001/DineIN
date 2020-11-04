//
//  CheckoutView.swift
//  DineIn
//
//  Created by Gokul Nair on 02/11/20.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let deliveryTimes = ["Morning","Midday","Afternoon","Tonight"]
    static let paymentTypes = ["Cash","Credit Card","DineIn Points","Vouchers","Gift Card"]
    static let tipAmounts = [0,10,15,20,25]
    static let deliverySpeeds = ["DineIN Basic","DineIN Express"]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount =  1
    @State private var deliveryTime = 0
    @State private var deliverySpeed = 0
    @State private var showAlert = false
    
    var time:String{
        let times = String(CheckoutView.deliveryTimes[deliveryTime])
        return times
    }
    
    var deliveryCharge: Double {
        if CheckoutView.deliverySpeeds[deliverySpeed] == "DineIN Express" {
            let total = Double(order.total)
            return total/100 * 20
        }
        else{
            return 0
        }
    }
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total/100 * Double(CheckoutView.tipAmounts[tipAmount])
        
       return total + tipValue + deliveryCharge
    }
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to Pay?", selection: $paymentType){
                    ForEach(0 ..< CheckoutView.paymentTypes.count){
                        Text(CheckoutView.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()){
                    Text("Add DineIN Loyalty Card")
                }
                if addLoyaltyDetails{
                    TextField("Add DineIN Card ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add Delivery Time").foregroundColor(.green)){
                Picker("", selection: $deliveryTime){
                    ForEach(0 ..< CheckoutView.deliveryTimes.count){
                        Text("\(CheckoutView.deliveryTimes[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Add Delivery Type").foregroundColor(.green)){
                Picker("", selection: $deliverySpeed){
                    ForEach(0 ..< CheckoutView.deliverySpeeds.count){
                        Text("\(CheckoutView.deliverySpeeds[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Text("Extra 20% on DineIN Express.").font(.caption).foregroundColor(.gray)
            }
            
            Section(header: Text("Add a Tip").foregroundColor(.green)){
                Picker("Percentage:",selection: $tipAmount){
                    ForEach(0 ..< CheckoutView.tipAmounts.count){
                        Text("\(CheckoutView.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                        Text("Total: $ \(totalPrice, specifier: "%.2f")").foregroundColor(.green).font(.largeTitle)
            ){
                Button(action:{self.showAlert.toggle()}){
                    HStack{
                        Image(systemName: "flame.fill")
                        Text("Confirm Order")
                    }.padding(.leading, 100)
                }.foregroundColor(.green)
            }
            
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showAlert){
            Alert(title: Text("Order Confirmed"), message: Text("Your total bill is $ \(totalPrice, specifier: "%.2f"), will be delivered by \(time)- Thank you for dining with DineIN"), dismissButton: .default(Text("OK")))
        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
