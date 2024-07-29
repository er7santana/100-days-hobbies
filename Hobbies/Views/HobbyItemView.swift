//
//  HobbyItemView.swift
//  Hobbies
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 29/07/24.
//

import SwiftUI

struct HobbyItemView: View {
    let hobby: Hobby
    var body: some View {
        HStack {
            Text(hobby.title)
            
            Spacer()
            
            Text(hobby.completedActivities.formatted())
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    HobbyItemView(hobby: Hobby(title: "Play Guitar"))
}
