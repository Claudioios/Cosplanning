//
//  ProfileView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 08/02/22.
//

import SwiftUI
import UIKit
struct ProjectView: View {
    @State private var showingAddRemove = false
    var body: some View {
        NavigationView{
                VStack{
                Rectangle()
                        .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                    .foregroundColor(Color("ViolaBottoneChiaro"))

                VStack{
                    ScrollView{
                        Text("hi")
                    }
                    .font(.title)
            }
            .navigationTitle("Projects")
            .background(Image("Background"))
        }
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        showingAddRemove.toggle()
                    }
                label: {
                    Label ("add", systemImage: "plus.circle.fill")
                        .foregroundColor(Color("Giallo"))
                }
                .sheet(isPresented: $showingAddRemove) {
                   NewProjectView()
                }
                    }
                }
        }
        
    }
    }
   
struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
