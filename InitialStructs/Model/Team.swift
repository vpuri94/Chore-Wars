//
//  Team.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/21/21.
//

import Foundation

struct Team {
    var id: String = UUID().uuidString
    let joinCode: String = ""
    let teamName: String = ""
    var lastRoundWinner: String = ""
    var lastRoundLoser: String = ""
    var CurrentReward: String = ""
    var currentPunishment: String = ""
    
    
    mutating func setCurrentPunishment(newPunishment: String){
        currentPunishment = newPunishment
        
    }
    mutating func setCurrentReward(newPunishment: String){
        currentPunishment = newPunishment
        
    }
}
