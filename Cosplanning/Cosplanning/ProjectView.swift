//
//  ProfileView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI
import UIKit
struct ProjectView: View {
    
    var body: some View {
            NavigationView{
                VStack{
                        ScrollView{
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        
                    }
                    .font(.title)
            }
            .navigationTitle("Projects")
            .background(Image("Background"))
            
        }
        }
        
    }
    



struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
