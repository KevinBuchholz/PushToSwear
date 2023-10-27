//
//  ContentView.swift
//  RandomCurseGenerator
//
//  Created by Kevin Buchholz on 10/26/23.
//

import SwiftUI



struct ContentView: View {
    
let swearManager = SwearManager()
    
    var body: some View {
        VStack {
            Button(action: swearManager.curseOutLoud , label: {
                Circle()
                    .foregroundStyle(.red)
                    .overlay(Text("PUSH\nTO\nSWEAR"))
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
