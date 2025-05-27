//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Antcliff on 5/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I am an app devloper"
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.red)
                .frame(width: 200, height: 200)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            HStack{
                Button("Awesome") {
                    message = "Awesome!"
                }
               
                Button("Great") {
                    message = "Great"
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
