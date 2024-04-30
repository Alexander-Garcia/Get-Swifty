//
//  ContentView.swift
//  HelloWorld
//
//  Created by Alexander Garcia on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    // these are called "properties" inside the "View"
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]

    // "Property Wrapper" needed because we are altering a value of a view property
    // we add private since this state is local to this view and we don't want other views changing it
    @State private var selected = "Archery"
    @State private var id = 1
    
    var body: some View {
        VStack {
            Text("Why not try...")
                .font(.largeTitle.bold())
            // the id on this stack is telling Swift that upon clicking of the button
            // which updates the id that a new VStack should be rendered and we want to
            // add an animation to that happening with .transition
            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())")
                            .font(.system(size: 140))
                            .foregroundColor(.white)
                    )
                Text("\(selected)")
                    .font(.title)
            }
            .padding()
            .transition(.slide)
            .id(id)
            
            // add space pushing title to the top and button to the bottom
            Spacer()
            
            Button("Try again") {
                // this will run when clicked
                // randomElement returns optional string so just in case its empty we need to address that with ??
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
            
        }
    }
}

#Preview {
    ContentView()
}
