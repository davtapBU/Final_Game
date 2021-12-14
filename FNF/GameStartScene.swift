//
//  GameStartScene.swift
//  FNF
//
//  Created by Brian Liew on 11/17/21.
//

import SpriteKit

class GameStartScene: SKScene {
    
    let label = SKLabelNode(fontNamed: "Chalkduster")
    let sublabel = SKLabelNode(fontNamed: "Chalkduster")
        
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.yellow
        
        label.text = "Twinkle night Funkin'"
        label.fontColor = SKColor.black
        label.fontSize = 48
        label.position = CGPoint(x: 0, y: 0)
                
        sublabel.text = "Tap anywhere to begin"
        sublabel.fontColor = SKColor.black
        sublabel.fontSize = 36
        sublabel.position = CGPoint(x: 0, y: -300)
        
        addChild(label)
        addChild(sublabel)
        
        // label animations
        let scale_up = SKAction.scale(to: 1.05, duration: 0.25)
        let scale_down = SKAction.scale(to: 1.0, duration: 0.25)
        // sublabel animations
        let fade_in = SKAction.fadeIn(withDuration: 0.5)
        let fade_out = SKAction.fadeOut(withDuration: 0.5)
        
        label.run(SKAction.repeatForever(SKAction.sequence([scale_up, scale_down])))
        sublabel.run(SKAction.repeatForever(SKAction.sequence([fade_in, fade_out])))
        
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run(background_animation),
            SKAction.wait(forDuration: 1)
        ])))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // guard let touch = touches.first else { return }
        
        if let view = self.view {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFit
                view.presentScene(scene, transition: SKTransition.doorway(withDuration: 0.5))
            }
        }
    }
    
    func background_animation() {
        let node = SKSpriteNode(imageNamed: "note.png")
        node.position = CGPoint(x: CGFloat.random(in: (-screen_width...screen_width)), y: screen_height)
        
        addChild(node)
            
        let movement = SKAction.move(by: CGVector(dx: 0, dy: -screen_height * 2), duration: TimeInterval.random(in: (1...5)))
        let rotation = SKAction.rotate(byAngle: 10 * .pi, duration: TimeInterval.random(in: (5...10)))
        let removal = SKAction.removeFromParent()
        
        node.run(SKAction.sequence([SKAction.group([movement, rotation]), removal]))
    }
    
}
