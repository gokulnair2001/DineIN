//
//  AppView.swift
//  DineIn
//
//  Created by Gokul Nair on 02/11/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ContentView().tabItem {
                Image(systemName: "book.closed")
                Text("Menu")
            }
            OrderView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Order")
            }
            FavouriteFood().tabItem {
                Image(systemName: "suit.heart")
                Text("Favorites")
            }
        }.accentColor(.green)
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
