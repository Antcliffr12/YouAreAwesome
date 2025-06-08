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
    @State private var messages:[String] = []
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
   
    
    
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
               
                //generate random number to use as index
                // if messagenumber == lastNumber
                //keep going until a message number != lastMessageNumber
                //set messageString to messages[messageNumber]
                //update the lastMessageNumber
                
                var messageNumber = Int.random(in: 0...messages.count-1)
               
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0...messages.count-1)
                }
            
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber = Int.random(in: 0...9)
                
                imageName  = "image\(imageNumber)"
                
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                 
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

