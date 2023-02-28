//
//  DetailView.swift
//  ToDoList
//
//  Created by Caitlin Price on 2/27/23.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var passedValue: String
    
    var body: some View {
        VStack{
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
            Text("You Are a Swift Legend!\n And you passed over the value \(passedValue)")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.yellow)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Get Back!") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
     
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Item 1")
    }
}
