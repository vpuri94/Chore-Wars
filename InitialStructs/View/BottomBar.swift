//
//  BottomBar.swift
//  dashboard
//
//  Created by Sihan Wu on 11/5/21.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        HStack {
            Image("dashboard-icon")
                .padding()
            Spacer()
            Image("leaderboard-icon")
            Spacer()
            Image("add-icon")
            Spacer()
            Image("chores-icon")
            Spacer()
            Image("reviews-icon")
            Spacer()
        }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
