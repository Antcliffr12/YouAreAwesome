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
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.red)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.orange)
            Button("Click Me!") {
                message = "Awesome!"
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
