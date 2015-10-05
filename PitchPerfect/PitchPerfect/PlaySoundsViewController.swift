//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Rebecca Rich on 10/3/15.
//  Copyright (c) 2015 iampeke. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if var path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            var fileUrl = NSURL(string: path)
            audioPlayer = AVAudioPlayer(contentsOfURL: fileUrl, error: nil)
            audioPlayer.enableRate = true
        } else {
            println("the filePath is empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onPlaySlow(sender: UIButton) {
        playSound(0.5, startFromTop:true)
    }
    
    @IBAction func onPlayFast(sender: UIButton) {
        playSound(1.5, startFromTop:true)
    }
    
    @IBAction func onStop(sender: UIButton) {
        audioStop()
    }
    
    func playSound(speedOfPlay: Float, startFromTop: Bool) {
        audioStop()
        audioPlayer.rate = speedOfPlay
        if (startFromTop) {
            audioPlayer.currentTime = 0.0
        }
        audioPlayer.play()
    }
    
    func audioStop() {
        audioPlayer.stop()
    }
    
}
