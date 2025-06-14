//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Antcliff on 5/26/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    
    @State private var messages:[String] = []
    
    @State private var lastMessageNumber: Int = -1
    @State private var lastImageNumber: Int = -1
    @State private var lastSoundNumber: Int = -1
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    
    let numberOfImages = 10
    let numberOfSounds = 6
    
    
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
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack{
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { newValue in
                        if audioPlayer != nil {
                            if audioPlayer.isPlaying {
                                audioPlayer.stop()
                            }
                        }
                    }
                
                Spacer()
                
                Button("Show Me") {
                    messages = ["Great", "Amazing", "Good Job!", "You're the best!", "Be Better", "When the Genius Bar needs help"]
                    
                    //TODO: func called here
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, UpperBounds: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, UpperBounds: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, UpperBounds: numberOfSounds-1)
                    
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                    
                }
            }
            
            
            
            
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
    func nonRepeatingRandom(lastNumber: Int, UpperBounds: Int) -> Int {
        var newNumber: Int
        
        repeat {
            newNumber = Int.random(in: 0...UpperBounds)
        } while newNumber == lastNumber
        
        return newNumber
        
    }
    func playSound(soundName: String ) {
        guard let soundFile = NSDataAsset(name: soundName) else{
            print("Could not read file name \(soundName)")
            return
        }
        
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch{
            print("ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

