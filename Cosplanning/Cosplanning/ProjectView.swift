//
//  ProfileView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI

struct ProjectView: View {
    var body: some View {
        VStack{
           
            List {
                Text("Projects on going")
            }
            List {
                Text("Projects finished")
            }
            Button("Start new project"){
                print ("new project")
                
            }
            
        
        .padding()
    }
    
}
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
