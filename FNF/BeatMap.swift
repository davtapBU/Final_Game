//
//  BeatMap.swift
//  FNF
//
//  Created by David Tapia on 11/17/21.
//
import UIKit

struct Note {
    // Properties of any given note
    let direction: Int
    let length: Int
    
    // Whether a note needs be held down or not
    let held: Bool
    // Value and length for hold note i.e Held length = half, HeldNum = 3 --> Hold note for 3 half notes
    let heldLength: Int
    let heldNum: Int
}

struct BeatMap {
    
    // Beats per minute -- Used to determine delay between notes
    let bpm: Double
    
    // Name to be displayed as song name
    let songName: String
    
    // File name of song
    let fileName: String
    
    // Time delay before first note of song
    let startDelay: Double
    
    var notes: [Note]
}

// Enumerations for note properties

//Direction will tell us where to place note and what button it will need to interact with
enum directions{
    static let Left: Int = 0
    static let Right: Int = 1
    static let Up: Int = 2
    static let Down: Int = 3
    static let End: Int = 4
}

//Length will tell us how
enum lengths{
    static let Whole: Int = 0
    static let Half: Int = 1
    static let Quarter: Int = 2
    static let Eighth: Int = 3
    static let Sixteenth: Int = 4
    static let ThirtySecond: Int = 5
}
