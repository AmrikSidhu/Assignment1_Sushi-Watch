//
//  GameScene.swift
//  assignmentOneSushiWatch
//
//  Created by Z Angrazy Jatt on 2019-11-02.
//  Copyright © 2019 Z Angrazy Jatt. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let cat = SKSpriteNode(imageNamed: "character1")
    let sushiBase = SKSpriteNode(imageNamed:"roll")

    // Creating Sushi Tower
    var sushiTower:[SushiPiece] = []
    let sushiPieceGap:CGFloat = 80
    var catPosition = "left"

    // Show life and score labels
    let lifeLabel = SKLabelNode(text:"Lives =: ")
    let scoreLabel = SKLabelNode(text:"Score =: ")

    var lives = 5
    var score = 0


    func spawnSushi() {

        // creating a sushi
        let sushi = SushiPiece(imageNamed:"roll")
        
        // getting SushiTower size
        if (self.sushiTower.count == 0) {
            // if tower is empty so positioning the sushiPiece
            sushi.position.y = sushiBase.position.y
                + sushiPieceGap
            sushi.position.x = self.size.width*0.5
        }
        else {
            let previousSushi = sushiTower[self.sushiTower.count - 1]
            sushi.position.y = previousSushi.position.y + sushiPieceGap
            sushi.position.x = self.size.width*0.5
        }

        // Adding sushi on display scene
        addChild(sushi)

        // adding in Array (appending)
        self.sushiTower.append(sushi)
    }

    override func didMove(to view: SKView) {
        // adding background
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = -1
        addChild(background)

        // adding cat
        cat.position = CGPoint(x:self.size.width*0.25, y:100)
        addChild(cat)

        // adding base_sushi (Bottom)
        sushiBase.position = CGPoint(x:self.size.width*0.5, y: 100)
        addChild(sushiBase)
        self.buildTower()

        // Adiing Labels
        self.scoreLabel.position.x = 80
        self.scoreLabel.position.y = size.height - 90
        self.scoreLabel.fontName = "Avenir"
        self.scoreLabel.fontSize = 25
        addChild(scoreLabel)

        // Life label
        self.lifeLabel.position.x = 80
        self.lifeLabel.position.y = size.height - 130
        self.lifeLabel.fontName = "Avenir"
        self.lifeLabel.fontSize = 25
        addChild(lifeLabel)
    }

    func buildTower() {
        for _ in 0...6 {
            self.spawnSushi()
        }
    }


   override func update(_ currentTime: TimeInterval) {
    }



      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

          guard let mousePosition = touches.first?.location(in: self) else {
              return
          }
  
          print(mousePosition)
          let pieceToRemove = self.sushiTower.first
          if (pieceToRemove != nil) {
              // removing sushi from the scene
              pieceToRemove!.removeFromParent()
            // removing from ArrayPosition
              self.sushiTower.remove(at: 0)
  
              // reArranging the SushiTower
              for piece in sushiTower {
                  piece.position.y = piece.position.y - sushiPieceGap
              }
  
              //adding new Sushi to make sequenceses of sushies afeter removing one piece !
              self.spawnSushi()
          }
          // 1. detecting screen click
          let middleOfScreen  = self.size.width / 2
          if (mousePosition.x < middleOfScreen) {
              print("Tapped On Left")
              // 2. person clicked left, so move cat left
              cat.position = CGPoint(x:self.size.width*0.25, y:100)
  
              // change the cat's direction
              let facingRight = SKAction.scaleX(to: 1, duration: 0)
              self.cat.run(facingRight)
  
              // save cat's position
              self.catPosition = "left"
  
          }
          else {
              print("Tapped On Right")
              // 2. person clicked right, so move cat right
              cat.position = CGPoint(x:self.size.width*0.85, y:100)
  
              // change the cat's direction
              let facingLeft = SKAction.scaleX(to: -1, duration: 0)
              self.cat.run(facingLeft)
  
              // save cat's position
              self.catPosition = "right"
          }
  
          //Cat flipp animation Texture
          let image1 = SKTexture(imageNamed: "character1")
          let image2 = SKTexture(imageNamed: "character2")
          let image3 = SKTexture(imageNamed: "character3")
  
          let punchTextures = [image1, image2, image3, image1]
  
          let punchAnimation = SKAction.animate(
              with: punchTextures,
              timePerFrame: 0.1)
  
          self.cat.run(punchAnimation)
        // win or loose logic
        
          if (self.sushiTower.count > 0) {
            
              let firstSushi:SushiPiece = self.sushiTower[0]
              let chopstickPosition = firstSushi.stickPosition
  
              if (catPosition == chopstickPosition) {
                
                  print("Cat Position = \(catPosition)")
                  print("Stick Position = \(chopstickPosition)")
                  print("you loose!")
  
                  self.lives = self.lives - 1
                  self.lifeLabel.text = "Lives: \(self.lives)"
              }
              else if (catPosition != chopstickPosition) {
                  print("Cat Position = \(catPosition)")
                  print("Stick Position = \(chopstickPosition)")
                  print("You win")
  
                  self.score = self.score + 5
                  self.scoreLabel.text = "Score: \(self.score)"
              }
          }
  
          else {
              print("empty Tower!")
          }
  
      }
  
  }
