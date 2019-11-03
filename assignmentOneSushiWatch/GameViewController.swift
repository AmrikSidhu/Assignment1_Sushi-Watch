//
//  ViewController.swift
//  assignmentOneSushiWatch
//
//  Created by Z Angrazy Jatt on 2019-11-02.
//  Copyright © 2019 Z Angrazy Jatt. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let scene = GameScene(size:self.view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.showsPhysics = true
        //presenting View as GameScene
        skView.presentScene(scene)
    }


}

