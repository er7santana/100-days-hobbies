//
//  Hobby.swift
//  Hobbies
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 29/07/24.
//

import Foundation

struct Hobby: Identifiable, Codable, Hashable {

    var id = UUID()
    var title: String
    var completedActivities = 0
    
    init(id: UUID = UUID(), title: String, completedActivities: Int = 0) {
        self.id = id
        self.title = title
        self.completedActivities = completedActivities
    }
}
