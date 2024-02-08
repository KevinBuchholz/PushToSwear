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
        
        
        let allSwears = ["shitt", "fuck", "damn", "piss", "bitch", "cock", "cunt", "buggerr", "crapp", "frigg", "prick", "twatt", "slagg"]
        
        
        let allNouns = ["cuzin", "mother", "father", "sister", "brother", "grandma", "grandpa", "cock", "dick", "tit", "ass", "butthole", "asshole", "clit", "chair", "table", "sofa", "banana", "donkey", "chicken", "dillhole", "wobble", "pillbox", "giraffe", "lollipop", "twit", "shrimp", "jizz", "granny", "bastard", "slag", "sandwich", "gibbon"]
        
        
        let allVerbs = ["suck", "fuck", "eat", "lick", "tayst", "hump", "jok", "chok", "gobbl", "guzzl"]
        
        
        let allParts = ["cock", "dick", "tit", "ass", "butthole", "asshole", "clit", "pussy", "titty", "taint", "snatch", "scrotum", "leg", "arm", "hand", "mouth", "foot", "butt", "kneecap", "elbow", "toe", "finger"]
        
        
        let allAdjectives = ["superflewus", "fantastic", "super speshal", "tremen duhs", "philandering", "gigantic", "intrinsic", "farsical", "selfish", "stupid", "tragic", "great", "big", "titanic", "metaphysical", "sawed off", "relentless", "desperate", "greedy", "incestuous", "stinking", "rotten", "filthy", "low down", "tiny", "sanctimonious", "orange", "bulbous", "thrombose"]
        
        let allSwearsClean = ["darn", "dang", "heck", "gosh", "shoot", "jeez", "fudge"]
        
        
        let allNounsClean = ["puppy", "kitten", "marshmallow", "baby"]
        
        
        let allVerbsClean = ["hug", "tap", "kiss", "compliment", "help"]
        
        
        let allPartsClean = ["toosh", "tooshy", "fanny"]
        
        
        let allAdjectivesClean = ["wonderful", "happy", "terrific"]
        
        let shakespeare = ["Thou damned and luxurious mountain goat", "Scurvy politician", "Thou damned doorkeeper to every custrel that comes inquiring for his Tib!", "Where got’st thou that goose look?", "Base dunghill villain and mechanical", "Finch-egg!", "You Banbury cheese!", "You bull’s pizzle", "You scullion, you rampallion, you fustilarian!", "You whoreson cullionly barber-monger!", "A most notable coward, an infinite and endless liar, an hourly promise breaker, the owner of no one good quality.", "Away, you starvelling, you elf-skin, you dried neat’s-tongue, bull’s-pizzle, you stock-fish!", "Away, you three-inch fool!", "Come, come, you froward and unable worms!", "Go, prick thy face, and over-red thy fear, Thou lily-liver’d boy.", "I am sick when I do look on thee", "I must tell you friendly in your ear, sell when you can, you are not for all markets.", "I’ll beat thee, but I would infect my hands.", "I scorn you, scurvy companion.", "Methink’st thou art a general offence and every man should beat thee.", "More of your conversation would infect my brain."]
        
        
        
        func insertRandomValue(list: [String]) -> String {
            let randomIndex : Int = .random(in: 0..<list.count)
            
            return String(list[randomIndex])
        }
        
        var adjective : String = ""
        var firstWord : String = ""
        var secondWord : String = ""
        var bard : String = ""
        
        
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
        
        func curseOutLoudClean() {
            
            let swearingClean = "\(insertRandomValue(list: allSwearsClean))ing"
            let swearerClean = "\(insertRandomValue(list: allSwearsClean))er"
            let nounChoiceClean = "\(insertRandomValue(list: allNounsClean))"
            let bodyPartChoiceClean = "\(insertRandomValue(list: allPartsClean))"
            let verberClean = "\(insertRandomValue(list: allVerbsClean))er"
            let adjectivesClean = "\(insertRandomValue(list: allAdjectivesClean))"
            let shakespeare = "\(insertRandomValue(list: shakespeare))"
            
            func getShakespeare() {
                let doesShakespeareExist = Bool.random()
                
                if doesShakespeareExist {
                    bard = shakespeare
                    return
                }
                else {
                    bard = ""
                }
            }
            
            func shakespeareOnly() {
                bard = shakespeare
            }
            
            func getAdjectiveClean() {
                let doesAdjectiveExist = Bool.random()
                
                if doesAdjectiveExist {
                    adjective = adjectivesClean
                } else {
                    adjective = ""
                }
            }
            
            func getFirstWordClean() {
                // random choice either allFamily or allSwears
                
                let firstChoice : Int = .random(in: 1...2)
                
                if firstChoice == 1 {
                    firstWord = swearingClean
                }else {
                    firstWord = nounChoiceClean
                }
            }
            
            func getSecondWordClean() {
                
                let secondChoice : Int = .random(in: 1...4)
                
                if secondChoice == 1 {
                    secondWord = swearerClean
                } else if secondChoice == 2 {
                    secondWord = bodyPartChoiceClean
                } else if secondChoice == 3  {
                    secondWord = verberClean
                } else {
                    secondWord = nounChoiceClean
                }
            }
            
              shakespeareOnly()
//            getShakespeare()
//            getAdjectiveClean()
//            getFirstWordClean()
//            getSecondWordClean()
            
            if firstWord != secondWord {
                let utterance = AVSpeechUtterance(string: "\(bard)")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                utterance.rate = 0.45
                
                synthesizer.speak(utterance)
            } else {
                shakespeareOnly()
                getAdjectiveClean()
                getFirstWordClean()
                getSecondWordClean()
                
                let utterance = AVSpeechUtterance(string: "\(bard)")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                utterance.rate = 0.45
                
                synthesizer.speak(utterance)
            }
        }
        
        
    }

