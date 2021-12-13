//
//  GameScene.swift
//  FNF
//
//  Created by David Tapia on 11/29/21.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    var music: AVAudioPlayer!
    var firstNote: Bool = true
    
    var button1: SKSpriteNode!
    var button2: SKSpriteNode!
    var button3: SKSpriteNode!
    var button4: SKSpriteNode!
    
    var note1: SKSpriteNode!
    var note2: SKSpriteNode!
    var note3: SKSpriteNode!
    var note4: SKSpriteNode!
    
    let tapLine: CGFloat = -500
    
    override func sceneDidLoad() {
        createWorld()
        playSong(map: ttls)
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
    
    func createWorld() {
        // Create the background node
        let backgroundNode = SKSpriteNode(imageNamed: "bg")
        backgroundNode.zPosition = -2
        backgroundNode.setScale(2.2)
        addChild(backgroundNode)
        
        button1 = SKSpriteNode(imageNamed: "butt1")
        button2 = SKSpriteNode(imageNamed: "butt2")
        button3 = SKSpriteNode(imageNamed: "butt3")
        button4 = SKSpriteNode(imageNamed: "butt4")
        
        button1.setScale(1.5)
        button2.setScale(1.5)
        button3.setScale(1.5)
        button4.setScale(1.5)
        
        button1.position = CGPoint(x: -screen_width+40, y: tapLine)
        button2.position = CGPoint(x: -screen_width+200, y: tapLine)
        button3.position = CGPoint(x: screen_width-200, y: tapLine)
        button4.position = CGPoint(x: screen_width-50, y: tapLine)
        
        addChild(button1)
        addChild(button2)
        addChild(button3)
        addChild(button4)
    }
    
    func playSong(map: BeatMap) {
        if let musicURL = Bundle.main.url(forResource: "ttls", withExtension: "m4a") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                music = audioPlayer
                music.numberOfLoops = 0
                music.play()
                print("playing...")
            }
            else {
                print("error!!")
            }
        }
        
        queueNotes(map: map)
    }
    
    @objc func queueNote(timer: Timer) {
        print("called!")
        let sprite = SKSpriteNode(color: UIColor.red, size: CGSize(width:40, height:40))
        sprite.texture = SKTexture(imageNamed: "playnote")
        sprite.setScale(3.0)
        let dir : Int = (timer.userInfo as? Int)!
        
        switch(dir){
        case directions.Left:
            sprite.position = CGPoint(x: -screen_width+100, y: screen_height)
            note1 = sprite
        case directions.Down:
            sprite.position = CGPoint(x: -screen_width+290, y: screen_height)
            note2 = sprite
        case directions.Up:
            sprite.position = CGPoint(x: screen_width-290, y: screen_height)
            note3 = sprite
        case directions.Right:
            sprite.position = CGPoint(x: screen_width-100, y: screen_height)
            note4 = sprite
        default:
            break
        }
        
        
        addChild(sprite)
        
        let movement = SKAction.move(by: CGVector(dx:0, dy:2 * -screen_height), duration: 2.3)
        let removal = SKAction.removeFromParent()
        
        sprite.run(SKAction.sequence([movement, removal]))
        
    }
    
    func queueNotes(map: BeatMap) {
        // Calculate bps
        let bps : Double = (map.bpm)/60.0
        
        // Delay between notes
        var delay: Double = map.startDelay
        
        // Queue notes and increase dispatch delay of next note depending on current note length
        map.notes.forEach { note in
            
            let context = note.direction
            Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(queueNote), userInfo: context, repeats: false)
            
            switch(note.length)
            {
            case lengths.Whole:
                delay += bps * 4
            case lengths.Half:
                delay += bps * 2
            case lengths.Quarter:
                delay += bps * 1
            case lengths.Eighth:
                delay += bps / 2
            case lengths.Sixteenth:
                delay += bps / 4
            case lengths.ThirtySecond:
                delay += bps / 8
            default: break
            }
        }
    }
}
