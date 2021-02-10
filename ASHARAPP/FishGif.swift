//
//  FishGif.swift
//  ASHARAPP
//
//  Created by Ashar Afaq on 5/21/20.
//  Copyright © 2020 Ashar Afaq. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
class FishGif: SKScene {

    var fishFrames:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.cyan
        var frames:[SKTexture] = [ ]
       let fishAtlas = SKTextureAtlas(named: "fishgif")
        for index in 1...4{
          let textureName = "fish_\(index)"
            let texture = fishAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        self.fishFrames = frames
    }
    func swimFish(){
        let texture = self.fishFrames![0]
        let fish = SKSpriteNode(texture: texture)
         fish.size = CGSize(width: 140, height: 140)
        
        let rightToLeft = arc4random() % 2 == 0
        let xPosition = rightToLeft ? self.frame.size.width + fish.size.width / 2 : -fish.size.width / 2
        
        let randFishYPos = GKRandomDistribution(lowestValue: 50, highestValue: Int(self.frame.size.height))
        let yposition = CGFloat(randFishYPos.nextInt())
        
        fish.position = CGPoint(x: xPosition, y: yposition)
        
        if rightToLeft {
            fish.xScale = -1
            
        }
        self.addChild(fish)
        
        fish.run(SKAction.repeatForever(SKAction.animate(with: self.fishFrames!, timePerFrame: 0.05, resize: false, restore: true)))
        
        var distanceToCover = self.frame.size.width + fish.size.width
        
        if rightToLeft {
            distanceToCover *= -1
        }
        let time = TimeInterval(abs(distanceToCover/140))
        
        let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: time)
        let removeAction = SKAction.run{
            fish.removeAllActions()
            fish.removeFromParent()
        }
        let allActions = SKAction.sequence([moveAction, removeAction])
        
        fish.run(allActions)
    }
    
    
    
    
    
    
    
}
