//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Tommy Vo Tran on 6/22/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    var answerOptions: [String]? = nil
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answerOptions = a
        self.answer = correctAnswer
    }
    
    
}
