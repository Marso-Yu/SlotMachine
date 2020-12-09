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
    @IBOutlet weak var showGodOfWealth: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    var timer1: Timer?
    var timer2: Timer?
    var timer3: Timer?
    var timer4: Timer?
    var timer5: Timer?
    var timer6: Timer?
    var score:Int = 9
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        for slotImage in showSlotImages{
            slotImage.layer.borderWidth = 5
        }
        let skView = SKView(frame: showGodOfWealth.frame)
        skView.backgroundColor = .clear
        showGodOfWealth.insertSubview(skView, at: 0)
           let scene = SKScene(size: skView.frame.size)
           scene.anchorPoint = CGPoint(x: 0.5, y: 1)
        scene.backgroundColor = .clear
           let emitterNode = SKEmitterNode(fileNamed: "MyParticle")
           scene.addChild(emitterNode!)
           skView.presentScene(scene)
        scoreLabel.text = String(score)
        scoreLabel.textAlignment = .center
        scoreLabel.backgroundColor = .black
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
        
        if score < 10 {
            print("test")
            let actionSheetAlert = UIAlertController(title: "代幣不足", message: "阿姨走到你面前，該對阿姨說什麼？", preferredStyle: .actionSheet)
            let auntAction = UIAlertAction(title: "阿姨 我不想努力了", style: .default) { (UIAlertAction) in
                self.score += 100
                self.scoreLabel.text = String(self.score)
            }
            //let cancelAction = UIAlertAction(title: "阿姨 掰掰", style: .cancel, handler: nil)
            actionSheetAlert.addAction(auntAction)
            //actionSheetAlert.addAction(cancelAction)
            self.present(actionSheetAlert, animated: true, completion: nil)
        }
        else{
            timer4?.invalidate()
            timer5?.invalidate()
            timer6?.invalidate()
            var picture1RandomNumber: Int?
            var picture2RandomNumber: Int?
            var picture3RandomNumber: Int?
            score -= 10
            scoreLabel.text = String(score)
            
            timer1 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                picture1RandomNumber = Int.random(in: 3...3)
                        UIImageView.transition(with: self.showSlotImages[0], duration: 0.1, options: .transitionFlipFromTop, animations: {
                            if let picture1RandomNumber = picture1RandomNumber{
                                self.showSlotImages[0].image = UIImage(named: "picture\(picture1RandomNumber)")
                            }
                    }, completion: nil)
                })
            
            timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                picture2RandomNumber = Int.random(in: 3...3)
                        UIImageView.transition(with: self.showSlotImages[1], duration: 0.1, options: .transitionFlipFromTop, animations: {
                            if let picture2RandomNumber = picture2RandomNumber{
                                self.showSlotImages[1].image = UIImage(named: "picture\(picture2RandomNumber)")
                            }
                    }, completion: nil)
                })

            
            timer3 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                picture3RandomNumber = Int.random(in: 3...3)
                        UIImageView.transition(with: self.showSlotImages[2], duration: 0.1, options: .transitionFlipFromTop, animations: {
                            if let picture3RandomNumber = picture3RandomNumber{
                                self.showSlotImages[2].image = UIImage(named: "picture\(picture3RandomNumber)")
                            }
                    }, completion: nil)
                })


            timer4 = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (Timer) in
                self.timer1?.invalidate()
            })
            
            timer5 = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (Timer) in
                self.timer2?.invalidate()
            })
            
            timer6 = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (Timer) in
                self.timer3?.invalidate()
                if picture1RandomNumber == picture2RandomNumber, picture2RandomNumber == picture3RandomNumber
                {
                    if let picture3RandomNumber = picture3RandomNumber
                    {
                        switch picture3RandomNumber {
                        case 1:
                            self.score += 20
                            let alerController = UIAlertController(title: "恭喜中獎", message: "🍌香蕉🍌 ＋ 20", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    //                        let byeAction = UIAlertAction(title: "Bye~", style: .default) { (UIAlertAction) in
    //                            print("you want to do")
    //                        }
                            alerController.addAction(okAction)
                            //alerController.addAction(byeAction)
                            self.present(alerController, animated: true, completion: nil)
                        
                        case 2:
                            self.score += 50
                            let alerController = UIAlertController(title: "恭喜中獎", message: "🍒櫻桃🍒 ＋ 50", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alerController.addAction(okAction)
                            self.present(alerController, animated: true, completion: nil)
                            
                        case 3:
                            self.score += 100000
                            let alerController = UIAlertController(title: "恭喜中大獎", message: "💰💰💰 ＋ 100", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alerController.addAction(okAction)
                            self.present(alerController, animated: true, completion: nil)
                        default:
                            break
                        }
                        
                        self.scoreLabel.text = String(self.score)
                    }
                    
                }
                self.playButton.isEnabled = true
            })
        }
    }
}
