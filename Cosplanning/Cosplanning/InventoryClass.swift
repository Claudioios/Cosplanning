//
//  InventoryClass.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 18/02/22.
//

import SwiftUI

struct InventoryModel {
    
    internal init(Name: String, Price: Double, Quantity: String) {
        
        self.Name = Name
        self.Price = Price
        self.Quantity = Quantity
        
    }

    let Name: String
    let Price: Double
    let Quantity: String
    
}

class ArrayInventoryModel: ObservableObject{
    
    @Published var ArrayInventoryOperations: [InventoryModel]
    
    init()
    {
        self.ArrayInventoryOperations = []
        
    }
}
