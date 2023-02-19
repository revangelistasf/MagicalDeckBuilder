//
//  Card.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 18/02/23.
//

import Foundation

struct Card: Decodable {
    let id: String?
    let name: String?
    let manaCost: String?
    let cmc: Int?
    let colors: [String]?
    let colorIdentity: [String]?
    let type: String?
    let types: [String]?
    let subtypes: [String]?
    let rarity: String?
    let set: String?
    let setName: String?
    let text: String?
    let artist: String?
    let number: String?
    let power: String?
    let toughness: String?
    let layout: String?
    let multiverseid: String?
    let imageUrl: String?
    let printings: [String]?
    let originalText: String?
    let originalType: String?
}

struct CardsResponse: Decodable {
    let cards: [Card]
}
