//
//  ItemDetail.swift
//  DineIn
//
//  Created by Gokul Nair on 01/11/20.
//

import SwiftUI

struct ItemDetail: View {
   
    @EnvironmentObject var order: Order
    
    var item: MenuItem
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                
            Image(item.mainImage).clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 4)).padding(.top)
                
                Text("PC:\(item.photoCredit)").padding(3).background(Color.black).font(.caption).foregroundColor(.white).offset(x: -5, y: 15)
            }
            Text(item.description)
                .lineLimit(30)
                .padding()
            

            Button(action: {self.order.add(item: item)}){
                //Image(systemName: "cart")
                Text("Order This").padding(7)
            }.foregroundColor(.white).font(.headline).background(Color.green).cornerRadius(5)
            
            Spacer()
        }.navigationBarTitleDisplayMode(.inline).navigationTitle(Text(item.name))
    }
}

struct BlueButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .font(.headline)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .contentShape(Rectangle())
        .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
        .listRowBackground(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
  }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
