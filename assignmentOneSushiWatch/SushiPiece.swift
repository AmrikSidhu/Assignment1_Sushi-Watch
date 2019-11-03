//
//  SushiPiece.swift
//  assignmentOneSushiWatch
//
//  Created by Z Angrazy Jatt on 2019-11-02.
//  Copyright © 2019 Z Angrazy Jatt. All rights reserved.
//

import Foundation
import SpriteKit

// creating SushiPiece Class
class SushiPiece: SKSpriteNode {
    
    //Variables
    var StickImage:SKSpriteNode!
    var stickPosition:String = ""
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
      // getting stick image
        self.StickImage = SKSpriteNode(imageNamed: "chopstick")
       
        // random stick left or rigth logic
        let pos = Int.random(in: 0...2)
        if (pos == 0) {
            self.stickPosition = ""
            
        }
        else if (pos == 1) {
            self.stickPosition = "right"
            
            // Atright
            self.StickImage.position.x = self.position.x + 100
            self.StickImage.position.y = self.position.y - 10
            
            // flip the image
            let facingRight = SKAction.scaleX(to: -1, duration: 0)
            self.StickImage.run(facingRight)
            
            //adding stick on the scene
            addChild(self.StickImage)
        }
        else if (pos == 2) {
            self.stickPosition = "left"
            
            // Atleft
            self.StickImage.position.x = self.position.x - 100
            self.StickImage.position.y = self.position.y - 10
            
            //adding stick on the scene
            addChild(self.StickImage)
        }
        
        
       
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
