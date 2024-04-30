//
//  ContentView.swift
//  PickAPal
//
//  Created by Raphael Vitor on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd: String = ""
    @State private var pickName: String = ""
    @State private var shouldRemoveName: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .font(.largeTitle)
                
                Text("Pick-a-pal")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
            }
            .foregroundStyle(.tint)
            .symbolRenderingMode(.hierarchical)
            
            Text(pickName.isEmpty ? " " : pickName)
                .padding(.top, 16)
                .font(.title3)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Toggle("Remove pick names", isOn: $shouldRemoveName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickName = randomName
                    
                    if shouldRemoveName {
                        names.removeAll { name in
                            return (name == randomName)
                        }
                    }
                } else {
                    pickName = " "
                }
            } label: {
                Text("Pick a name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title3)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
