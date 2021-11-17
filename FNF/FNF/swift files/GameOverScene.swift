//
//  GameOverScene.swift
//  FNF
//
//  Created by Brian Liew on 11/17/21.
//

import SpriteKit

class GameOverScene: SKScene {
    
    let label = SKLabelNode(fontNamed: "Chalkduster")
    let sublabel = SKLabelNode(fontNamed: "Chalkduster")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.yellow
        
        label.text = "GAME OVER"
        label.fontColor = SKColor.black
        label.fontSize = 48
        label.position = CGPoint(x: 0, y: 0)
        
        sublabel.text = "tap anywhere to restart"
        sublabel.fontColor = SKColor.black
        sublabel.fontSize = 36
        sublabel.position = CGPoint(x: 0, y: -100)
                
        addChild(label)
        addChild(sublabel)
        
        let fadein = SKAction.fadeIn(withDuration: 0.5)
        let fadeout = SKAction.fadeOut(withDuration: 0.5)
        
        sublabel.run(SKAction.repeatForever(SKAction.sequence([fadein, fadeout])))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // guard let touch = touches.first else { return }
        
        if let view = self.view {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFit
                view.presentScene(scene, transition: SKTransition.crossFade(withDuration: 0.5))
            }
        }
    }
    
}
