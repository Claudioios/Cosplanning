//
//  TaskListView.swift
//  Cosplanning
//
//  Created by Claudio Silvestri on 11/02/22.
//

import SwiftUI

struct TaskListView: View {
    var body: some View {
        Rectangle()
            .frame(width: .infinity, height: 55)
            .border(Color.gray)
            .foregroundColor(.white)
            .overlay()
                {
                    HStack{
                        Text("Task Number 1")
                            .padding()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding()
                    }
                }
                
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
