//
//  ViewController.swift
//  SlotMachine
//
//  Created by Marso on 2020/12/8.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    @IBOutlet var showSlotImages: [UIImageView]!
    var timer1: Timer?
    var timer2: Timer?
    var timer3: Timer?
    var timer4: Timer?
    var timer5: Timer?
    var timer6: Timer?
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        for slotImage in showSlotImages{
            slotImage.layer.borderWidth = 5
        }
        let skView = SKView(frame: view.frame)
           view.insertSubview(skView, at: 0)
           let scene = SKScene(size: skView.frame.size)
           scene.anchorPoint = CGPoint(x: 0.5, y: 1)
           let emitterNode = SKEmitterNode(fileNamed: "MyParticle")
           scene.addChild(emitterNode!)
           skView.presentScene(scene)
        // Do any additional setup after loading the view.
    }

    @IBAction func play(_ sender: Any) {
//        timer1 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
//                for slotImage in self.showSlotImages{
//                let pictureNumber = Int.random(in: 1...3)
//                    UIImageView.transition(with: slotImage, duration: 0.1, options: .transitionFlipFromTop, animations: {
//                    slotImage.image = UIImage(named: "picture\(pictureNumber)")
//                }, completion: nil)
//                }
//            })
        playButton.isEnabled = false
        timer4?.invalidate()
        timer5?.invalidate()
        timer6?.invalidate()
        
        timer1 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                let pictureNumber = Int.random(in: 1...3)
                    UIImageView.transition(with: self.showSlotImages[0], duration: 0.1, options: .transitionFlipFromTop, animations: {
                        self.showSlotImages[0].image = UIImage(named: "picture\(pictureNumber)")
                }, completion: nil)
            })
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                let pictureNumber = Int.random(in: 1...3)
                    UIImageView.transition(with: self.showSlotImages[1], duration: 0.1, options: .transitionFlipFromTop, animations: {
                        self.showSlotImages[1].image = UIImage(named: "picture\(pictureNumber)")
                }, completion: nil)
            })

        
        timer3 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                let pictureNumber = Int.random(in: 1...3)
                    UIImageView.transition(with: self.showSlotImages[2], duration: 0.1, options: .transitionFlipFromTop, animations: {
                        self.showSlotImages[2].image = UIImage(named: "picture\(pictureNumber)")
                }, completion: nil)
            })


        timer4 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in
            self.timer1?.invalidate()
        })
        
        timer5 = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { (Timer) in
            self.timer2?.invalidate()
        })
        
        timer6 = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (Timer) in
            self.timer3?.invalidate()
            self.playButton.isEnabled = true
        })
    }
}
