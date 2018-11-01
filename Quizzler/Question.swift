//
//  Question.swift
//  Quizzler
//
//  Created by Abhilash on 01/11/18.
//  Copyright © 2018 SweetGodzillas. All rights reserved.
//

import Foundation
import UIKit

class Question {
    
    let questionText:String
    let answer:Bool
    
    init(text:String, correctAnswer:Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
