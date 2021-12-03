//
//  Team.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/21/21.
//

import Foundation

struct Team {
    var id: String = UUID().uuidString
    var joinCode: String = ""
    var teamName: String = ""
    var lastRoundWinner: String = ""
    var lastRoundLoser: String = ""
    var currentReward: String = ""
    var currentPunishment: String = ""
    
    mutating func setCurrentPunishment(newPunishment: String){
        currentPunishment = newPunishment
        
    }
    mutating func setCurrentReward(newReward: String){
        currentReward = newReward
        
    }
}
