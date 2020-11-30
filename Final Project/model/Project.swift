//
//  Project.swift
//  Final Project
//
//  Created by Richard Hernandez on 11/18/20.
//

import Foundation


struct Project: Equatable {
    var name: String
    var language: String
    public var hashtags = [String]()
    var descrption: String
    var projectString: String {
        
        var hashtagString = ""
        for hashtag in hashtags {
            hashtagString += hashtag + ","
        }
        let desc = "\(name):\(language):\(hashtagString):\(descrption)\n"
        return desc
        
    }
    
    init(name: String, language: String, hashtags: [String] = [], description: String = "") {
        self.name = name
        self.language = language
        self.hashtags = hashtags
        self.descrption = description
    }
    
}
