//
//  ContentView.swift
//  RandomCurseGenerator
//
//  Created by Kevin Buchholz on 10/26/23.
//

import SwiftUI



struct ContentView: View {
    
    let swearManager = SwearManager()
    var hasButtonBeenPushed = false
    
    @State var isClean : Bool = false
    
    func makeAChoice() {
        if !isClean {
            swearManager.curseOutLoud() }
        else {
            swearManager.curseOutLoudClean()
        }
    }
        
    var body: some View {
        VStack {
//            if !hasButtonBeenPushed {
//                
//            } else {
//                Text(swearManager.firstWord)
//            }
            Button(action: makeAChoice , label: {
                Circle()
                    .foregroundStyle(.red)
                    .overlay(Text("PUSH\nTO\nSWEAR"))
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            })
        }
        .padding()
        
        Toggle("Clean", isOn: $isClean)
            .padding()
            .font(.title)

          
        }
    }


#Preview {
    ContentView()
}
