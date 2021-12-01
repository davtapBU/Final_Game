//
//  BeatMap.swift
//  FNF
//
//  Created by David Tapia on 11/17/21.
//
import UIKit

struct Note {
    // Properties of any given note
    let direction: CGFloat
    let length: CGFloat
    
    // Whether a note needs be held down or not
    let held: Bool
    // Value and length for hold note i.e Held length = half, HeldNum = 3 --> Hold note for 3 half notes
    let heldLength: CGFloat
    let heldNum: CGFloat
}

struct BeatMap {
    
    // Beats per minute -- Used to determine delay between notes
    let bpm: CGFloat
    
    // Name to be displayed as song name
    let songName: String
    
    // File name of song
    let fileName: String
    
    var notes: [Note]
}

// Enumerations for note properties

//Direction will tell us where to place note and what button it will need to interact with
enum directions{
    static let Left: CGFloat = 0
    static let Right: CGFloat = 1
    static let Up: CGFloat = 2
    static let Down: CGFloat = 3
}

//Length will tell us how
enum lengths{
    static let Whole: CGFloat = 0
    static let Half: CGFloat = 1
    static let Quarter: CGFloat = 2
    static let Eighth: CGFloat = 3
    static let Sixteenth: CGFloat = 4
    static let ThirtySecond: CGFloat = 5
}
