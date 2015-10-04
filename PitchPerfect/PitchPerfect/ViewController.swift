//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Rebecca Rich on 10/3/15.
//  Copyright (c) 2015 iampeke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var startRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.hidden = true
        startRecordingButton.enabled = true
    }

    // Listener for Clicking the Microphone Asset
    @IBAction func onRecord(sender: UIButton) {
        recordingInProgress.hidden = false
        stopRecordingButton.hidden = false
        startRecordingButton.enabled = false
        //TODO: Start the recording
        println("in onRecord")
        
    }

    @IBAction func onStopRecord(sender: UIButton) {
        recordingInProgress.hidden = true
        stopRecordingButton.hidden = true
        startRecordingButton.enabled = true
    }
    
}

