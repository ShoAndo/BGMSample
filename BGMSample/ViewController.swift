//
//  ViewController.swift
//  BGMSample
//
//  Created by 安藤奨 on 2019/08/19.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
//    var i = 0
//    カセットデッキ的なやつ
    var player: AVAudioPlayer!
    
//    var isPlaying = true

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        再生する音楽ファイルのパス作成,テンプレ
        //        forresource:音楽のファイルの名前
        
        //        ofType:ファイルの形式
        let audioPath = Bundle.main.path(forResource: "bgm1", ofType: "mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        
//        音楽ファイルをもとに、プレイヤー作成
//        do-catchが必要な分はエラーが出る
        do{
            player = try AVAudioPlayer(contentsOf: audioUrl)
//            無限るーぷ
            player.numberOfLoops = -1
        }catch let error{
            print(error.localizedDescription)
        }
//        再生
        player.delegate = self //おまじない
        player.prepareToPlay() //再生の準備
        player.play()          //再生
        
        
    }

   @IBAction func didClickButton(_ sender: Any) {
 /*       i += 1
        
        if i == 1{
            button.
            player.pause()
        }else if i == 2{
            i = 0
            player.play()
           
        }
 */
    
    /*
     if isPlaying{
        player.pause()
     }else{
        player.play()
     }
     
     isPlaying = !isPlaying
     
     }
 */
    
    if player.isPlaying{
        player.pause()
        button.setTitle("再生", for: .normal)
    }else{
        player.play()
        button.setTitle("停止", for: .normal)
        
    }
      
    }

    
}

