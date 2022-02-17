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
    @State private var projects = 0
    var body: some View {
        NavigationView{
                VStack{
                Rectangle()
                        .frame(width: .infinity, height: 55).ignoresSafeArea( edges: .top)
                    .foregroundColor(Color("ViolaBottoneChiaro"))

                    VStack{
                        Spacer()
                        if projects == 0 {
                            VStack{
                                Image("emptyimage")
                                    .background()
                                Text("There is nothing here")
                                    .font(.title2)
                                    .foregroundColor(Color("ViolaBottone"))
                                    .padding()
                            
                        }
                        }
                        Spacer()
                       
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
