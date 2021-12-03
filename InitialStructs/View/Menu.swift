//
//  Menu.swift
//  InitialStructs
//
//  Created by Viraj Puri on 12/2/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFunctions
var db = Firestore.firestore()

struct Menu: View {
    @ObservedObject private var taskViewModel = TaskViewModel()
    @ObservedObject  var user: UserViewModel
    @State var tag = 0
    var body: some View {
            NavigationView {
                if (tag == 1){
                    UserProfileView(user:user)
                }else{
                    VStack{
                        Button(action: {
                            tag = 1
                        }) {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .font(.title)
                                Text("My Account")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(40)
                        }
                        Button(action: {
                            print("Settings tapped!")
                        }) {
                            HStack {
                                Image(systemName: "gearshape")
                                    .font(.title)
                                Text("Team Settings")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(40)
                        }
                        Button(action: {
                            resetTeam()
                        }) {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                    .font(.title)
                                Text("Reset")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(40)
                        }
                    }
                .navigationBarTitle("Chore Wars").font(.custom("Montserrat", size: 22))
                .navigationBarTitleDisplayMode(.inline)
                 .onAppear(){
                        self.taskViewModel.fetchData()
                        
                }
                }
                
            }
    }
    /*
    func claimAChore(){
        
        
       if(task.isNotClaimed()){
           task.claimed = user.currentUserID
           taskViewModel.updateData(taskId: task.id
                                    , userID: user.currentUserID)
           user.updatePoints(userId: user.currentUserID, points: task.points)
       }
   }
 */
    
    func updatePoints(userId:String,points:Int){
        let user = db.collection("User").document(userId)
        user.getDocument { (document, error) in
            if let document = document, document.exists {
                var totalPoints = document.get("totalPoints")
                totalPoints = totalPoints as! Int + points
                db.collection("User").document(userId).updateData(["totalPoints": totalPoints ?? 0])
            } else {
                print("Document does not exist")
            }
        }
//            var user = User(firstName: firstName, lastName: lastName, displayName: displayName, totalPoints: totalPoints)
    }
    
    func resetTeam(){
        var functions = Functions.functions()
        var team = AuthViewModel.currentTeam
        functions.httpsCallable("resetNotify").call(["team": team?.joinCode, "winner": team?.lastRoundWinner, "loser": team?.lastRoundLoser, "prize":team?.currentReward, "punishment": team?.currentPunishment]){result, error in
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo
                }
            }
        }
        var rewards = ["All team members must buy winner dinner. ","Everyone buys winner a shot","Loser must clean winners room","Everyone does winners laundry for next week", "Winner gets to choose the next bar they go to" ]
        var punishments = ["Loser must clean winners room", "Loser must do everyones dishes for next week", "Loser must clean the house", "Loser has to call an ex telling him/her that the loser misses them", "Loser has to make an embarassing TikTok of winners choice", "Loser has to let rest of group DM someone from losers IG/Twitter/FB account"]
        
        db.collection("Task").whereField("team", isEqualTo: user.currentUserTeam)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        db.collection("Task").document(document.documentID).delete() { err in
                            if let err = err {
                                print("Error removing document: \(err)")
                            }
                        }
                    }
                }
        }
        //call the random func
        let randomReward = rewards.randomElement()
        let randomPunishment = punishments.randomElement()
        AuthViewModel.currentTeam?.currentReward = randomReward ?? "All team members must buy winner dinner. "
        AuthViewModel.currentTeam?.currentPunishment = randomPunishment ?? "Loser must clean winners room"
        db.collection("Team").whereField("code", isEqualTo: user.currentUserTeam)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for document in querySnapshot!.documents {
                        
                        db.collection("Team").document(document.documentID).setData([
                            "currentPunishment" : randomPunishment,
                            "currentReward" : randomReward
                        ], merge: true) { err in
                            if let err = err {
                                print("Error removing document: \(err)")
                            }
                        }
                        
                    }
                    
                }
                
        }
        
    }
    
}

/*
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(user: user)
    }
}
*/
