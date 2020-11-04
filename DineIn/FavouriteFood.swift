//
//  FavouriteFood.swift
//  DineIn
//
//  Created by Gokul Nair on 02/11/20.
//

import SwiftUI

struct FavouriteFood: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            List{
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }.navigationTitle("Favourites").listStyle(GroupedListStyle())
        }
    }
}

struct FavouriteFood_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        FavouriteFood().environmentObject(order)
    }
}
