//
//  ViewController.swift
//  SolarSystemArKitProject
//
//  Created by Gamze Akyüz on 10.05.2024.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Güneş
        let sun = createSphere(radius: 0.2, content: "sun.jpg", vector: SCNVector3(0, 0, -1), text: "Sun")
        sceneView.scene.rootNode.addChildNode(sun)
        
        // Diğer gezegenler
        let mercury = createSphere(radius: 0.05, content: "mercury.jpg", vector: SCNVector3(0.4, 0.2, -1), text: "Mercury")
        sceneView.scene.rootNode.addChildNode(mercury)

        let venus = createSphere(radius: 0.06, content: "venus.jpg", vector: SCNVector3(0.7, 0.2, -1), text: "Venus")
        sceneView.scene.rootNode.addChildNode(venus)

        let earth = createSphere(radius: 0.07, content: "earth.jpg", vector: SCNVector3(1.0, 0.2, -1), text: "Earth")
        sceneView.scene.rootNode.addChildNode(earth)

        let mars = createSphere(radius: 0.06, content: "mars.jpg", vector: SCNVector3(1.3, 0.2, -1), text: "Mars")
        sceneView.scene.rootNode.addChildNode(mars)

        let jupiter = createSphere(radius: 0.15, content: "jupiter.jpg", vector: SCNVector3(1.6, 0.2, -1), text: "Jupiter")
        sceneView.scene.rootNode.addChildNode(jupiter)

        let saturn = createSphere(radius: 0.12, content: "saturn.jpg", vector: SCNVector3(1.9, 0.2, -1), text: "Saturn")
        sceneView.scene.rootNode.addChildNode(saturn)

        let uranus = createSphere(radius: 0.1, content: "uranus.jpg", vector: SCNVector3(2.2, 0.2, -1), text: "Uranus")
        sceneView.scene.rootNode.addChildNode(uranus)

        let neptune = createSphere(radius: 0.095, content: "neptune.jpg", vector: SCNVector3(2.5, 0.2, -1), text: "Neptune")
        sceneView.scene.rootNode.addChildNode(neptune)

        // Ay
        let moon = createSphere(radius: 0.02, content: "moon.jpg", vector: SCNVector3(1.0, 0.2, -1), text: "Moon")
        sceneView.scene.rootNode.addChildNode(moon)

        // Yıldızlar
        let stars = createSphere(radius: 0.099, content: "stars.jpg", vector: SCNVector3(1.2, 0.2, -1), text: "Stars")
        sceneView.scene.rootNode.addChildNode(stars)


        sceneView.automaticallyUpdatesLighting = true
        
        
        
    }
    
    func createSphere(radius: CGFloat, content:String, vector:SCNVector3, text: String) -> SCNNode{
            
        let mySphere = SCNSphere(radius: radius)
            
        let boxMaterial = SCNMaterial()
        
        let textNode = createTextNode(text: text, position: SCNVector3(vector.x, vector.y + Float(radius) + 0.1, vector.z))
        
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        
        mySphere.materials = [boxMaterial]
        
        
        let node = SCNNode()
            
        node.position = vector
            
        node.geometry = mySphere
        
        node.addChildNode(textNode)
        
        return node
    }
    func createTextNode(text: String, position: SCNVector3) -> SCNNode {
        let textGeometry = SCNText(string: text, extrusionDepth: 0.1)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.black
        let textNode = SCNNode(geometry: textGeometry)
        textNode.position = position
        textNode.scale = SCNVector3(0.01, 0.01, 0.01) // Metin boyutunu ayarla
        
        return textNode
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
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
