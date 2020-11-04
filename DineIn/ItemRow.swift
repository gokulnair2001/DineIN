//
//  ItemRow.swift
//  DineIn
//
//  Created by Gokul Nair on 31/10/20.
//

import SwiftUI

struct ItemRow: View {
    
    static let colors: [String: Color] = ["D": .purple, "G": .red, "V": .green, "S": .blue, "N": .black]
    
    var item: MenuItem
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)){
        HStack {
            Image(item.thumbnailImage).clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(item.name).font(Font.custom("Avenir", size: 20)).fontWeight(.medium)
                Text("$\(item.price)").font(Font.custom("Avenir", size: 20)).fontWeight(.light)
            }.layoutPriority(1)
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self){ restriction in
                Text(restriction).foregroundColor(.white).font(.caption).fontWeight(.heavy).padding(5).background(Self.colors[restriction, default: .black]).clipShape(Circle())
            }
        }
      }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
