//
//  ContentView.swift
//  Jokes
//
//  Created by RGS on 29/4/23.
//

import SwiftUI

struct ContentView: View {
    
    let jokes = [
        Joke(setup:"Why did the scarecrow win an award?", punchline: "Because it was outstanding in its field!"),
        Joke(setup: "What did the pig say on a hot day?", punchline: "I'm a bacon"),
        Joke(setup: "Today at the bank, an old lady asked me to help check her balance.", punchline: "I pushed her over"),
        Joke(setup: "What do you call a fish without eyes?", punchline: "Fsh"),
        Joke(setup: "What do you get when you cross a snowman and a vampire?", punchline: "A frostbite"),
        Joke(setup: "If the internet had a boat, where would they park it?", punchline: "Google Doc"),
        Joke(setup: "What do you call a blind dinosaur", punchline: "Did-not-saur"),
        Joke(setup: "Why did the scarecrow win an award?", punchline: "Because it was outstanding in its field!"),
    ]
    
    
        @State private var showPunchline = false
        @State private var index = 0
        @State private var showAlert = false
        @State private var showSheet = false
        @State private var isPositiveFeedback = false 
        @State private var punchlineSize = 0.1
        @State private var punchlineRotation = Angle.degrees(0)
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea([.all])
            VStack {
            
            Text(jokes[index].setup)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Button {
                //Action for when main button is pressed
             withAnimation {
                    showPunchline = true
                }
            } label: {
                Text("Tell me!")
                    .font(.largeTitle)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .rotationEffect(punchlineRotation)
                    .scaleEffect(punchlineSize)
                    .onAppear{
                        withAnimation(.easeInOut(duration: 3)) {
                            punchlineSize = 1
                            punchlineRotation = .degrees(720)
                        }
                    }
                    .onDisappear{
                            punchlineSize = 0.1
                            punchlineRotation = .degrees(0)
                    }
            
            } .padding()
                
                if showPunchline == true {
                    Text(jokes[index].punchline)
                        .multilineTextAlignment(.center)
                    //          .opacity(showPunchline ? 1 : 0)
                    Text("Tap anywhere to continue")
                        .foregroundColor(.blue)
                        .padding()
            //            .opacity(showPunchline ? 1 : 0)
                }
                
                
           
        }
            .padding()
        }
        .alert("Did you like the last joke???", isPresented: $showAlert){
            Button("Yes!!!", role: .cancel){
                showSheet = true
                isPositiveFeedback = true
            }
            Button("Noooo!!!", role: .destructive){
                showSheet = true
                isPositiveFeedback = false
            }
        } message: {
            Text("Wasn't it awesome? I liked it, hope you like it too!")
        }
        .onTapGesture {
            showAlert = true
            if showPunchline{
                index += 1
                showPunchline = false
                if index == jokes.count {
                    index = 0
                    print("Restarted")
                    
                }
                
            }
        }
        .sheet(isPresented: $showSheet){
            FeedbackView(isPositiveFeedback:isPositiveFeedback)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
