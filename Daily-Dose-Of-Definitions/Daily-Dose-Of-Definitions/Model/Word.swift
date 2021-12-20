//
//  Word.swift
//  Daily-Dose-Of-Definitions
//
//  Created by Christian on 12/19/21.
//

import Foundation

struct Word: Codable {
    let word: String?
    let results: [WordResults]?
}

struct WordResults: Codable {
    let definition: String?
    let partOfSpeech: String?
    let synonyms: [String]?
    let antonyms: [String]?
    let examples: [String]?
}
