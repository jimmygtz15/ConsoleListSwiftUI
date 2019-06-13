//
//  ContentView.swift
//  DynamicListSwiftUI
//
//  Created by Jimmy Gutierrez on 6/12/19.
//  Copyright © 2019 Jimmy Gutierrez. All rights reserved.
//

import SwiftUI

struct Console: Identifiable {
    var id: Int
    
    let console, message, imageName: String
}

struct ContentView : View {
    
    let consoles: [Console] = [
        .init(id: 0, console: "Super Nintendo", message: "The best game console ever built", imageName: "snes"),
        .init(id: 1, console: "Nintendo 64", message: "Super Smashhhhh Broooos!!!!", imageName: "n64"),
        .init(id: 2, console: "Playstation 1", message: "Has very good fighting games!", imageName: "ps1"),
    ]
   
    
    var body: some View {
        NavigationView {
            List {
                Text("Consoles").font(.largeTitle)
                ForEach(consoles.identified(by: \.id)) { aConsole in
                    // user row
                    ConsoleRow(myConsole: aConsole)
                }
            }.navigationBarTitle(Text("SwiftUI"))
        }
    }
}

struct ConsoleRow: View {
    let myConsole: Console
    var body: some View {
        HStack {
            Image(myConsole.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 100, height: 100)
            //.clipped()
            VStack (alignment: .leading) {
                Text(myConsole.console).font(.headline)
                Text(myConsole.message).font(.subheadline).lineLimit(nil)
                }.padding(.leading, 8)
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
