//
//  CreateTeamView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/29/21.
//

import SwiftUI
import Firebase

struct CreateTeamView: View {
    @ObservedObject  var user: UserViewModel
    @State private var teamName: String = ""
    @State private var findTeam: String = ""
    @State private var message = ""
    @State private var shown = false
    @State  var found = false
    var db = Firestore.firestore()
    
    var body: some View {
        let width  = UIScreen.main.bounds.width
        if TeamViewModel().found{
            LogInView(user:user)
        }
        TextField(
            "First Name",
            text: $teamName
        ).frame(width: width-50, height: 50)
            .font(.custom("Montserrat",size: 18))
            .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.top)
        Button( action:{
            let joinCode = randomString(length: 6)
            if(teamName == "" ){
                self.message = "Team Name cant be null "
                self.shown.toggle()
            }
            TeamViewModel().addData(teamName: teamName, joinCode: joinCode)
            TeamViewModel().found.toggle()
            
        },label:{
            Text("Create a Team")
                .frame(width:width-100)
                .padding()
                .foregroundColor(Color.white)
                .cornerRadius(10)
        })
            .background(Color.CreateTeamColor)
            .cornerRadius(10)
            .alert(isPresented: $shown){
                return Alert(title: Text(self.message))
            }
        CenterDivider()
        TextField(
            "Enter Team Code",
            text: $findTeam
        ).frame(width: width-50, height: 50)
            .font(.custom("Montserrat",size: 18))
            .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.black, lineWidth: 1)
                ).disableAutocorrection(false)
                .padding(.top)
        
        Button( action:{
            if( self.findTeam == "" || self.findTeam.count != 6 ){
                self.message = "Enter 6 digit Team code"
                self.shown.toggle()
                return
            }
            TeamViewModel().findTeamInFirebase(joinCode: findTeam)
            if(!TeamViewModel().found){
                self.message = "Team not found"
                self.shown.toggle()
            }
            else{
                self.message = "Team Found"
                self.shown.toggle()
            }
            
//            let joinCode = randomString(length: 6)
//            TeamViewModel().addData(teamName: teamName, joinCode: joinCode)
            
        },label:{
            Text("Join a Team")
                .frame(width:width-100)
                .padding()
                .foregroundColor(Color.white)
                .cornerRadius(10)
        })
            .background(Color.signIn)
            .cornerRadius(10)
            .alert(isPresented: $shown){
                return Alert(title: Text(self.message))
            }
        
    }
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    func addData(teamName: String, joinCode:String){
        let team = Team(teamName: teamName, joinCode: joinCode)
        db.collection("Team").addDocument(data: team.teamDict())
    }
    
    func findTeamInFirebase(joinCode: String){
        print(AuthViewModel.authUser?.email as Any)
        db.collection("Team").whereField("code", isEqualTo:joinCode )
            .getDocuments() { (querySnapshot, err) in
                db.collection("User").whereField("email", isEqualTo: AuthViewModel.authUser?.email as Any)
                        .getDocuments() { (querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                for document in querySnapshot!.documents {
                                    db.collection("User").document(document.documentID).updateData(["team": joinCode ])
                                    found.toggle()
                                }
                            }
                            
                        }
            }
    }
}

//struct CreateTeamView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTeamView()
//    }
//}

struct TeamViewModel{
    @State fileprivate var found = false
    private var db = Firestore.firestore()
    func addData(teamName: String, joinCode:String){
        let team = Team(teamName: teamName, joinCode: joinCode)
        db.collection("Team").addDocument(data: team.teamDict())
    }
    
    func findTeamInFirebase(joinCode: String){
        print(AuthViewModel.authUser?.email as Any)
        db.collection("Team").whereField("code", isEqualTo:joinCode )
            .getDocuments() { (querySnapshot, err) in
                var user = db.collection("User").whereField("email", isEqualTo: AuthViewModel.authUser?.email as Any)
                        .getDocuments() { (querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                for document in querySnapshot!.documents {
                                    db.collection("User").document(document.documentID).updateData(["team": joinCode ?? ""])
                                }
                            }
                            
                        }
            }
    }

}
//    func updateUserTeam(){
//        let email = AuthViewModel.authUser?.email
//
//        db.collection("User").whereField(email, isEqualTo: email)
//    }
