//
//  Favourites.swift
//  DineIn
//
//  Created by Gokul Nair on 03/11/20.
//

import SwiftUI

class Favourites: ObservableObject {
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
