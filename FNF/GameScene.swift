//
//  GameScene.swift
//  FNF
//
//  Created by David Tapia on 11/29/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?

    override func sceneDidLoad() {

    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
    func playSong(map: BeatMap)
    {
        // Play the music
        let backgroundSound = SKAudioNode(fileNamed: map.fileName);
        self.addChild(backgroundSound)
        
        // Wait the set delay before queing notes
        DispatchQueue.main.asyncAfter(deadline: .now() + map.startDelay) {
            // Initialize time for queing
            var curTime : DispatchTime = .now()
            
            // Calculate bps
            let bps : CGFloat = map.bpm/60.0
            
            // Queue notes and increase dispatch delay of next note depending on current note length
            map.notes.forEach { note in
                switch(note.length)
                {
                case lengths.Whole:
                    self.queueNote(dline: curTime, note: note)
                    curTime = curTime + (bps*4)
                case lengths.Half:
                    self.queueNote(dline: curTime, note: note)
                    curTime = curTime + (bps*2)
                case lengths.Quarter:
                    self.queueNote(dline: curTime, note: note)
                    curTime = curTime + bps
                case lengths.Eighth:
                    self.queueNote(dline: curTime, note: note)
                    curTime = curTime + (bps/2)
                case lengths.Sixteenth:
                    self.queueNote(dline: curTime, note: note)
                    curTime = curTime + (bps/4)
                case lengths.ThirtySecond:
                    self.queueNote(dline: curTime, note: note)
                    curTime = curTime + (bps/8)
                default: break
                }
            }
        }
    }
    
    func queueNote(dline: DispatchTime, note: Note)
    {
        DispatchQueue.main.asyncAfter(deadline: dline) {
            
        }
    }
}
