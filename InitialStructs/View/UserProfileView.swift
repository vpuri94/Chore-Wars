//
//  UserProfileView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 12/3/21.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var user: UserViewModel
    var body: some View {
        VStack{
            ScoreCardView(user:user)
            List(self.user.AllUserTasks, id: \.id) {eachTask in
                ChoreRow(task: eachTask)
            }
        }
    }
}

