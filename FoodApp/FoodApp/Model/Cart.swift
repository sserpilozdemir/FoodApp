//
//  Cart.swift
//  FoodApp
//
//


import SwiftUI

struct Cart: Identifiable {
    
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
}

