//
//  ViewController.swift
//  ASHARAPP
//
//  Created by Ashar Afaq on 5/20/20.
//  Copyright © 2020 Ashar Afaq. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: SKView!
    var scene:FishGif?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scene = FishGif(size: CGSize(width: self.sceneView.frame.size.width
            , height: self.sceneView.frame.size.height))
        self.sceneView.presentScene(scene)
    }

    @IBAction func showFishButton(_ sender: Any) {
        if let scene = self.scene{
            scene.swimFish()
        }
    }
    
    
}

