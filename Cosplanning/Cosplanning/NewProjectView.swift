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
                                CosplayCard(image: "america")
                                Text("Captain America")
                            }
                            VStack{
                                CosplayCard(image: "deadpool")
                                Text("Deadpool")
                            }
                            VStack{
                                CosplayCard(image: "spider-man")
                                Text("Spider-Man")
                            }
                            VStack{
                                CosplayCard(image: "iron-man")
                                Text("Iron Man")
                            }
                        }
                        
                    }
                    
                }
                VStack{
                    CategoryCard(category: "DC Comics")
                    ScrollView(.horizontal){
                        
                        HStack{
                            VStack{
                                CosplayCard(image: "joker")
                                Text("Joker")
                            }
                            VStack{
                                CosplayCard(image: "superman")
                                Text("Superman")
                            }
                            VStack{
                                CosplayCard(image: "wonder-woman")
                                Text("Wonder Woman")
                            }
                        }
                        
                    }
                    
                }
                VStack{
                    CategoryCard(category: "Star Wars")
                    ScrollView(.horizontal){
                        HStack{
                            VStack{
                                CosplayCard(image: "darth-vader")
                                Text("Darth Vader")
                            }
                            VStack{
                                CosplayCard(image: "stormtrooper")
                                Text("Stormtrooper")
                            }
                        }
                    }
                }
                VStack{
                    CategoryCard(category: "Persona")
                    ScrollView(.horizontal){
                        HStack{
                            VStack{
                                CosplayCard(image: "joker-persona")
                                Text("Joker")
                                
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
