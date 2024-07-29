//
//  HobbyViewModel.swift
//  Hobbies
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 29/07/24.
//

import SwiftUI

class HobbyViewModel: ObservableObject {
    @Published var hobbies = [Hobby]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(hobbies) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"),
           let decodedItems = try? JSONDecoder().decode([Hobby].self, from: savedItems) {
            hobbies = decodedItems
            return
        }
        
        hobbies = []
    }
}
