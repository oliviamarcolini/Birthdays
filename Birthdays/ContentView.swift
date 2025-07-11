//
//  ContentView.swift
//  Birthdays
//
//  Created by Olivia Monteiro on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    //update info automatically
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    //friend array
    @State private var friends: [Friend] = [
        Friend(name: "Alex", birthday: .now),
        Friend(name: "Betsy", birthday: .now)
    ]
    
    var body: some View {
        NavigationStack{
            List(friends, id: \.name) { friend in HStack {
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
            }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                }
                
            }//pin birthday UI to bottom of screen
            
        } //closing nav stack
    } //closing the body
}//closing struct

#Preview {
    ContentView()
}
