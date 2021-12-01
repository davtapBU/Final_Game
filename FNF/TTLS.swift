//
//  TTLS.swift
//  FNF
//
//  Beatmap file for "Twinkle Twinkle Little Star"
//  Created by David Tapia on 12/12/21.
//

import UIKit

let ttlsbmap = [
    Note(direction: directions.Down, length: lengths.Eighth, held: false, heldLength: 0, heldNum: 0),
    Note(direction: directions.Down, length: lengths.Eighth, held: false, heldLength: 0, heldNum: 0),
    Note(direction: directions.Up, length: lengths.Eighth, held: false, heldLength: 0, heldNum: 0),
    Note(direction: directions.Up, length: lengths.Eighth, held: false, heldLength: 0, heldNum: 0),
    Note(direction: directions.Left, length: lengths.Eighth, held: false, heldLength: 0, heldNum: 0),
    Note(direction: directions.Left, length: lengths.Eighth, held: false, heldLength: 0, heldNum: 0),
    Note(direction: directions.Right, length: lengths.Quarter, held: true, heldLength: lengths.Quarter, heldNum: 1),
]

let ttls = BeatMap(bpm: 65.0, songName: "Twinkle Twinkle Little Star", fileName: "ttls", notes: ttlsbmap)

