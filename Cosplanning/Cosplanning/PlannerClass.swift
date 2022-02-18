//
//  PlannerClass.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 18/02/22.
//

import SwiftUI

struct PlannerModel {
    
    internal init(Title: String, Description: String, Materials: String, HoursWork: Int) {
        
        self.Title = Title
        self.Description = Description
        self.Materials = Materials
        self.HoursWork = HoursWork
        
    }

    let Title: String
    let Description: String
    let Materials: String
    let HoursWork: Int
    
}

class ArrayPlannerModel: ObservableObject{
    
    @Published var ArrayPlannerOperations: [PlannerModel]
    
    init()
    {
        self.ArrayPlannerOperations = []
        
    }
}
