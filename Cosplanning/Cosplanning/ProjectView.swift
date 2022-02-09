//
//  ProfileView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI

struct ProjectView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: NewProjectView()){
            Text("Start a new project")
        }
            }
            .navigationTitle("Projects")
        }
        
    }
       
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
