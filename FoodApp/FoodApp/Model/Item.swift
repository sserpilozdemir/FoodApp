//
//  Item.swift
//  FoodApp
//
//

import SwiftUI

struct Item: Identifiable {
    var id: String
    var item_name: String
    var item_cost: NSNumber
    var item_ratings: String
    var item_image: String
    var item_details: String
    var isAdded: Bool = false

}

