//
//  ProjectClass.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 18/02/22.
//

import SwiftUI

struct ProjectModel {
    
    internal init(Name: String) {
        
        self.Name = Name
    }

    let Name: String
}

class ArrayProjectModel: ObservableObject{
    
    @Published var ArrayProjectOperations: [ProjectModel]
    
    init()
    {
        self.ArrayProjectOperations = []
    }
}
