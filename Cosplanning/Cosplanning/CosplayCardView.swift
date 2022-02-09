//
//  CosplayCardView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI


struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(15)
            .shadow(color: Color.white, radius: 1, x: 0, y: 0)
        //            .shadow(radius: 2)
    }
    
}

struct CategoryCard: View {
    var category: String
    var body: some View{
        VStack(alignment: .leading) {
            Text(category)
                .font(.system(size: 26, weight: .bold, design: .default))
                .foregroundColor(.black)
                .padding()
        }
    }
}
    struct CosplayCard: View {
        
        var image: String
        var body: some View {
            HStack(alignment: .center) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.all)
                
            }
            //            .padding(.trailing)
            
            Spacer()
        }
    }
    

