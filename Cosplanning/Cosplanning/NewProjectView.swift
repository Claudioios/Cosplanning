//
//  NewProjectView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct NewProjectView: View {
    var body: some View {
        
        ScrollView{
            VStack{
                CategoryCard(category: "Marvel")
                ScrollView(.horizontal){
                    HStack{
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "america-cosplay", name: "Captain America", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                
                                CosplayCard(image: "america")
                            }
                        }
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "deadpool-cosplay", name: "Deadpool", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "deadpool")
                            }
                        }
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "spider-man-cosplay", name: "Spider-Man", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "spider-man")
                            }
                        }
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "iron-man-cosplay", name: "Iron-Man", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "iron-man")
                            }
                        }
                    }
                    
                }
                
            }
            VStack{
                CategoryCard(category: "DC Comics")
                ScrollView(.horizontal){
                    
                    HStack{
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "america-cosplay", name: "Captain America", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "joker")
                            }
                        }
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "america-cosplay", name: "Captain America", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "superman")
                            }
                        }
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "america-cosplay", name: "Captain America", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "wonder-woman")
                            }
                        }
                    }
                    
                }
                
            }
            VStack{
                CategoryCard(category: "Star Wars")
                ScrollView(.horizontal){
                    HStack{
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "america-cosplay", name: "Captain America", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "darth-vader")
                            }
                        }
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "america-cosplay", name: "Captain America", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "stormtrooper")
                            }
                        }
                    }
                }
            }
            VStack{
                CategoryCard(category: "Persona")
                ScrollView(.horizontal){
                    HStack{
                        VStack{
                            NavigationLink( destination: DescriptionCosplayView(image: "america-cosplay", name: "Captain America", description: "Here you can find all the tasks that you have to follow to complete this cosplay")){
                                CosplayCard(image: "joker-persona")
                            }
                            
                        }
                    }
                }
            }
            
            .padding()
            .navigationTitle("Start a new project")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}
