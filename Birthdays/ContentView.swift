//
//  ContentView.swift
//  Birthdays
//
//  Created by Olivia Monteiro on 7/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //update info automatically
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    //friend array
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack{
            List(friends) { friend in HStack {
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
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save"){
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        context.insert(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
                
            }//pin birthday UI to bottom of screen
            
        } //closing nav stack
    } //closing the body
}//closing struct

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
