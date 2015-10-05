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
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        if var path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
//            var fileUrl = NSURL(string: path)
//            audioPlayer = AVAudioPlayer(contentsOfURL: fileUrl, error: nil)
//            audioPlayer.enableRate = true
//        } else {
//            println("the filePath is empty")
//        }
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
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
    
    @IBAction func onPlayChipmunk(sender: UIButton) {
        playSoundWithVariablePitch(1000)
    }
    
    @IBAction func onPlayDarth(sender: UIButton) {
        playSoundWithVariablePitch(-1000)
    }
    
    @IBAction func onStop(sender: UIButton) {
        audioStop()
    }
    
    func playSoundWithVariablePitch(pitch: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to:changePitchEffect, format:nil)
        audioEngine.connect(changePitchEffect, to:audioEngine.outputNode, format:nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()

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
