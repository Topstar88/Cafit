//
//  Item.swift
//  Cafit
//
//  Created by Topstar88 on 12/6/21.
//

import Foundation

struct Item: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
}
