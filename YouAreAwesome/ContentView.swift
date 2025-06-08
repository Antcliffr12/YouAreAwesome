//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Antcliff on 5/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    @State private var messages:[String] = []
    
    
    
    var body: some View {
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeOut(duration: 0.15), value: message)
        
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
       
            
            Spacer()
            
            
            Button("Show Me") {
                messages = ["Great", "Amazing", "Good Job!", "You're the best!", "Be Better", "When the Genius Bar needs help"]
                
                imageName  = "image\(Int.random(in: 0...9))"
                                
                message = messages[Int.random(in: 0...messages.count-1)]
                
                
                
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
                
            }
            
            
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

