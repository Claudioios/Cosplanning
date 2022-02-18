//
//  BudgetClass.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 17/02/22.
//

//
//  RecipesModel.swift
//  Healtify
//
//  Created by Claudio Silvestri on 17/11/21.
//

import SwiftUI

// observableobject serve per rendere la classe osservabile a tutte le view (?)

struct BudgetModel {
    
    internal init(Money: Double, Description: String, Date: Date) {
        
        self.Money = Money
        self.Description = Description
        self.Date = Date
        
    }

    let Money: Double
    let Description: String
    let Date: Date
    
}

class ArrayModel: ObservableObject{
    
    @Published var ArrayBudgetOperations: [BudgetModel]
    
    init()
    {
        self.ArrayBudgetOperations = []
        
    }
}
