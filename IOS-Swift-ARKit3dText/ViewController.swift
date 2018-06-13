//
//  ViewController.swift
//  IOS-Swift-ARKit3dText
//
//  Created by Pooya on 2018-06-13.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var scnView: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scnView.delegate = self
        scnView.add3DText(showText: self.inputText!.text! )
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        scnView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        scnView.session.pause()
    }
    

    @IBAction func updateAct(_ sender: Any) {
        scnView.removeNodeByName(nodeName: "flyingText")
        scnView.add3DText(showText: self.inputText!.text! ,nodeName: "flyingText")
    }
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    
}

