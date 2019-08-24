//
//  ViewController.swift
//  WarCardGame
//
//  Created by Cédric Morier-Roy on 2019-08-22.
//  Copyright © 2019 Cédric Morier-Roy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer?
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    @IBAction func dealTapped(_ sender: Any) {
        
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if leftNumber > rightNumber {
            //left side wins
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
            
            guard let path = Bundle.main.path(forResource: "win", ofType: "wav") else {return}
            let url = URL(fileURLWithPath: path)
            audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(0.5, fadeDuration: 0.1)
            audioPlayer?.play()
        }
        else if leftNumber < rightNumber {
            //right side wins
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
            
            guard let path = Bundle.main.path(forResource: "lose", ofType: "wav") else {return}
            let url = URL(fileURLWithPath: path)
            audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(0.5, fadeDuration: 0.1)
            audioPlayer?.play()
        }
        else {
            //tie
            guard let path = Bundle.main.path(forResource: "tie", ofType: "wav") else {return}
            let url = URL(fileURLWithPath: path)
            audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(0.5, fadeDuration: 0.1)
            audioPlayer?.play()
        }
    }
    

}

