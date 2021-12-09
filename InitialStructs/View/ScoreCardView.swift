//
//  ScoreCardView.swift
//  dashboard
//
//  Created by Sihan Wu on 11/5/21.
//

import SwiftUI

struct ScoreCardView: View {
//    @State var currentUser: User
    
    @ObservedObject var user: UserViewModel
    @ObservedObject private var tasks = TaskViewModel()
//    var currentUser = UserViewModel().currentUser
    
    let width = UIScreen.main.bounds.width
    var body: some View {
        let image = Image("profile")
        VStack(alignment: .leading, spacing: 5) {
            Text("Your Points")
                .font(.custom("Montserrat-Bold",size: 19))
                .foregroundColor(.gray)
                .padding()
            HStack(alignment:.center) {
                Spacer()
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 84, height: 84, alignment: .center)
                    .padding()
                Spacer()
                VStack (alignment:.leading, spacing:4) {
                    Text(user.currentUser?.displayName ?? "Null")
                        .font(.custom("Montserrat-Bold",size: 22))
                        .foregroundColor(Color(UIColor.black))
                    Text(String(user.currentUser?.totalPoints ?? 0))
                        .font(.custom("Montserrat-Regular",size: 18))
                        .foregroundColor(Color(UIColor.black))
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.systemGray))
                    .padding()
                Spacer()
            }
            Spacer()
            .padding()
        }
        .background(Color(UIColor.systemBackground))
                    
    }
    
}

//            Text("Your Points")
//                .fontWeight(.bold)
//                .foregroundColor(.gray)
//            HStack {
//                image
//                .resizable()
//                        .scaledToFit()
//                        .clipShape(Circle())
//                    .frame(width: width*0.3, height: width*0.3, alignment: .center)
//                        .padding()
//                VStack (alignment: .leading) {
//                    Text(user.currentUser?.displayName ?? "Null").fontWeight(.bold)
//                    Text(String(user.currentUser?.totalPoints ?? 0)).fontWeight(.light)
//                }
//            }
//
//        .onAppear(){
//            self.user.getUser(userId: "HkcEBsGUnrEXzNRFief1")
 //       }

//struct ScoreCardView_Previews: PreviewProvider {
//    @ObservedObject  var user: UserViewModel
//    @State var tabSelection = 1
//    static var previews: some View {
//        ScoreCardView(user:user, tabSelection)
//    }
//}
