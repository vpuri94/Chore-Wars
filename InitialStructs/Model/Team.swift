//
//  Team.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/21/21.
//

import Foundation

struct Team {
    var id: String = UUID().uuidString
    var joinCode: String;
    var teamName: String;
    var currentReward: String = ""
    var currentPunishment: String = ""
    var lastRoundWinner: String = ""
    var lastRoundLooser: String = ""
    
    init(teamName: String, joinCode: String){
        self.teamName = teamName
        self.joinCode = joinCode
    }
    
    func teamDict() ->[String: Any]{
        let dict: [String:Any] = [
            "id": self.id ,
            "teamName": self.teamName,
            "code": self.joinCode,
            "currentReward": self.currentReward,
            "currentPunishment ": self.currentPunishment as Any,
            "lastRoundWinner": self.lastRoundWinner as Any,
            "lastRoundLooser": self.lastRoundLooser,
            ]
        return dict
    }
}
