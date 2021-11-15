//
//  ScoreCardView.swift
//  dashboard
//
//  Created by Sihan Wu on 11/5/21.
//

import SwiftUI

struct ScoreCardView: View {
//    @State var currentUser: User
    
//    var nullCase = User(firstName: "Null", lastName: "Null", displayName: "NULL", totalPoints: 0)
    @ObservedObject private var user = UserViewModel()
    @ObservedObject private var tasks = TaskViewModel()
//    var currentUser = UserViewModel().currentUser
    
    let width = UIScreen.main.bounds.width
    var body: some View {
        let image = Image("profile")
        VStack (alignment: .leading) {
            Text("Your Points")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            HStack {
                image
                .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                    .frame(width: width*0.3, height: width*0.3, alignment: .center)
                        .padding()
                VStack (alignment: .leading) {
                    Text(user.currentUser?.displayName ?? "Andrew124").fontWeight(.bold)
                    Text(String(user.currentUser?.totalPoints ?? 900)).fontWeight(.light)
                }
            }
            
        }
        .onAppear(){
            self.user.getUser(userId: "HkcEBsGUnrEXzNRFief1")
        }
        
    }
    }

//struct ScoreCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreCardView()
//    }
//}
