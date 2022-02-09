//
//  DescriptionCosplayView.swift
//  Cosplanning
//
//  Created by Giuseppe Sica on 09/02/22.
//

import SwiftUI

struct DescriptionCosplayView: View {
    var image: String
    var name: String
    var description: String
    var body: some View {
        ScrollView{
        VStack{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.all)
                
            Text(name)
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .center)
                .modifier(CardModifier())
                .padding()
            Text(description)
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .center)
                .modifier(CardModifier())
                .padding()
           
    }
}
    }
}
struct DescriptionCosplayView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionCosplayView(image: "", name: "", description: "")
    }
}
