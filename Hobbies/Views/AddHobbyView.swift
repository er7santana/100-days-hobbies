//
//  AddHobbyView.swift
//  Hobbies
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 29/07/24.
//

import SwiftUI

struct AddHobbyView: View {
    
    let hobby: Hobby?
    var isAdding: Bool {
        hobby == nil
    }
    var completed: Bool {
        !title.isEmpty
    }
    @ObservedObject var viewModel: HobbyViewModel
    @State private var title = ""
    @State private var completedActivities = 0
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: HobbyViewModel, hobby: Hobby? = nil) {
        self.viewModel = viewModel
        self.hobby = hobby
        if let hobby {
            _title = State(initialValue: hobby.title)
            _completedActivities = State(initialValue: hobby.completedActivities)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TextField("Title", text: $title)
                .padding(.top, 24)
            
            if !isAdding {
                
                Text("Activities Completed:")
                    .font(.headline)
                    .padding(.top, 24)
                Text(completedActivities.formatted())
                    .font(.largeTitle)
                    .bold()
                
                HStack {
                    Spacer()
                    Button("Add", systemImage: "plus") {
                        completedActivities += 1
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
                .padding(.top, 10)
                
            }
            
            Spacer()
            
        }
        .navigationTitle(isAdding ? "New Item" : "Edit item")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(isAdding)
        .padding()
        .toolbar {
            if completed {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        
                        if !isAdding {
                            if let index = viewModel.hobbies.firstIndex(where: { $0.id == hobby?.id }) {
                                viewModel.hobbies.remove(at: index)
                            }
                        }
                        
                        viewModel.hobbies.append(
                            Hobby(title: title,
                                  completedActivities: completedActivities
                                 ))
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            
            if isAdding {
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

#Preview("Edit Item") {
    return NavigationView {
        AddHobbyView(viewModel: HobbyViewModel(),
                     hobby: Hobby(title: "My title"))
    }
}

#Preview("New Item") {
    return NavigationView {
        AddHobbyView(viewModel: HobbyViewModel())
    }
}
