//
//  Functions.swift
//  RandomCurseGenerator
//
//  Created by Kevin Buchholz on 10/26/23.
//

import Foundation
import SwiftUI
import AVFoundation

class SwearManager {
    let synthesizer = AVSpeechSynthesizer()
    
    let allSwears = ["shitt", "fuck", "damn", "piss", "bitch", "cock", "cunt", "bugger", "crapp", "frigg", "prick", "twat"]
    
    let allNouns = ["cuzin", "mother", "father", "sister", "brother", "grandma", "grandpa", "cock", "dick", "tit", "ass", "butthole", "asshole", "clit", "chair", "table", "sofa", "banana", "donkey", "chicken", "dillhole", "wobble", "pillbox", "giraffe", "lollipop", "twit"]
    
    let allVerbs = ["suck", "fuck", "eat", "lick", "tast", "hump", "jok", "chok"]
    
    let allParts = ["cock", "dick", "tit", "ass", "butthole", "asshole", "clit", "pussy"]
    
    let allAdjectives = ["superflewus", "fantastic", "super speshal", "tremenduhs", "philandering", "gigantic", "intrinsic", "farsical", "selfish", "stupid", "tragic", "great", "big", "titanic", "metaphysical"]
    
    
    func insertRandomValue(list: [String]) -> String {
        let randomIndex : Int = .random(in: 0..<list.count)
        
        return String(list[randomIndex])
    }
    
    var adjective : String = ""
    var firstWord : String = ""
    var secondWord : String = ""
        
    func curseOutLoud() {
        
        let swearing = "\(insertRandomValue(list: allSwears))ing"
        let swearer = "\(insertRandomValue(list: allSwears))er"
        let nounChoice = "\(insertRandomValue(list: allNouns))"
        let bodyPartChoice = "\(insertRandomValue(list: allParts))"
        let verber = "\(insertRandomValue(list: allVerbs))er"
        let adjectives = "\(insertRandomValue(list: allAdjectives))"
       
        
        func getAdjective() {
            let doesAdjectiveExist = Bool.random()
            
            if doesAdjectiveExist {
                adjective = adjectives
            } else {
                adjective = ""
            }
        }
        
        func getFirstWord() {
            // random choice either allFamily or allSwears
            
            let firstChoice : Int = .random(in: 1...2)
            
            if firstChoice == 1 {
                firstWord = swearing
            }else {
                firstWord = nounChoice
            }
        }
        
        func getSecondWord() {
            
            let secondChoice : Int = .random(in: 1...4)
            
            if secondChoice == 1 {
                secondWord = swearer
            } else if secondChoice == 2 {
                secondWord = bodyPartChoice
            } else if secondChoice == 3  {
                secondWord = verber
            } else {
                secondWord = nounChoice
            }
        }
        
        getAdjective()
        getFirstWord()
        getSecondWord()
        
        if firstWord != secondWord {
            let utterance = AVSpeechUtterance(string: "\(adjective) \(firstWord)  \(secondWord)")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.45
            
            synthesizer.speak(utterance)
        } else {
            getAdjective()
            getFirstWord()
            getSecondWord()
            
            let utterance = AVSpeechUtterance(string: "\(adjective) \(firstWord)  \(secondWord)")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.45
            
            synthesizer.speak(utterance)
        }
    }
}
