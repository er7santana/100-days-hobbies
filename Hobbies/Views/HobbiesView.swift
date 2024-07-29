//
//  HobbiesView.swift
//  Hobbies
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 29/07/24.
//

import SwiftUI

struct HobbiesView: View {
    
    @ObservedObject private var viewModel = HobbyViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(viewModel.hobbies.sorted(by: { $0.title < $1.title })) { hobby in
                    NavigationLink(value: hobby) {
                        HobbyItemView(hobby: hobby)
                    }
                }
            }
            .navigationDestination(for: Hobby.self) { hobby in
                AddHobbyView(viewModel: viewModel, hobby: hobby)
            }
            .navigationDestination(for: Bool.self) { _ in
                AddHobbyView(viewModel: viewModel)
            }
            .navigationTitle("My Hobbies")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add", systemImage: "plus") {
                        path.append(true)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        HobbiesView()
    }
}
