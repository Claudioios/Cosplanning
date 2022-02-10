//
//  ProfileView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI
struct ProjectView: View {
    @State var selected = 1
    
    var body: some View {
        
        NavigationView{
            VStack{
                Picker(selection: $selected, label: Text("Projects"), content: {
                    Text("Projects on going").tag(1)
                    /*@START_MENU_TOKEN@*/Text("Projects completed").tag(2)/*@END_MENU_TOKEN@*/
                    
                })
                    .pickerStyle(SegmentedPickerStyle())
                    
                if selected == 1 {
                    List {
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                    }
                  

                } else {
                    List {
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                        Text ("Ciao ")
                    }
                  
                }
                NavigationLink(destination: NewProjectView()){
                    Text("Start a new project")
                }
                .padding()
            }
            .navigationTitle("Projects")
            Spacer()
               
        }
        
    }
    
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
