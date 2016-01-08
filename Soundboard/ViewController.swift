//
//  ViewController.swift
//  Soundboard
//
//  Created by Justin Vallely on 10/3/15.
//  Copyright (c) 2015 Justin Vallely. All rights reserved.
//

import UIKit
import AVFoundation

public class ViewController: UIViewController {

    var updater: CADisplayLink!

    var player: AVAudioPlayer = AVAudioPlayer()

    var audioPath = NSBundle.mainBundle().pathForResource("sound1", ofType: "wav")!

    let cornerRadius: CGFloat = 5
    let borderColor = UIColor.whiteColor().CGColor
    let borderWidth: CGFloat = 1.5
    let backgroundColor = UIColor(white: 0.5, alpha: 0.75).CGColor

    var buttons: [UIButton!] = []

    @IBOutlet weak var button1ProgressView: UIProgressView!
    @IBOutlet weak var button2ProgressView: UIProgressView!
    @IBOutlet weak var button3ProgressView: UIProgressView!
    @IBOutlet weak var button4ProgressView: UIProgressView!
    @IBOutlet weak var button5ProgressView: UIProgressView!
    @IBOutlet weak var button6ProgressView: UIProgressView!
    @IBOutlet weak var button7ProgressView: UIProgressView!
    @IBOutlet weak var button8ProgressView: UIProgressView!
    @IBOutlet weak var button9ProgressView: UIProgressView!

    var activeProgressView: UIProgressView!

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!


    @IBAction func button1Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button1ProgressView
        playSound("sound1")
    }

    @IBAction func button2Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button2ProgressView
        playSound("sound1")
    }

    @IBAction func button3Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button3ProgressView
        playSound("sound1")
    }

    @IBAction func button4Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button4ProgressView
        playSound("sound1")
    }

    @IBAction func button5Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button5ProgressView
        playSound("sound1")
    }

    @IBAction func button6Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button6ProgressView
        playSound("sound1")
    }

    @IBAction func button7Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button7ProgressView
        playSound("sound1")
    }

    @IBAction func button8Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button8ProgressView
        playSound("sound1")
    }

    @IBAction func button9Action(sender: AnyObject) {
        stopSound()
        activeProgressView = button9ProgressView
        playSound("sound1")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()

        var error: NSError? = nil

        do {
            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))

            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)

            activeProgressView = button1ProgressView

        } catch let error1 as NSError {
            error = error1
            print(error)
        }
    }

    func setupButtons() {

        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        buttons.append(button6)
        buttons.append(button7)
        buttons.append(button8)
        buttons.append(button9)

        for button in buttons {

            button.layer.cornerRadius = cornerRadius
            button.layer.borderColor = borderColor
            button.layer.borderWidth = borderWidth
            button.layer.backgroundColor = backgroundColor
        }

    }

    func playSound(sound: String) {

        print("sound: \(sound)")
        audioPath = NSBundle.mainBundle().pathForResource(sound, ofType: "wav")!

        var error: NSError? = nil

        do {
            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))

            updater = CADisplayLink(target: self, selector: Selector("trackAudio"))
            updater.frameInterval = 1
            updater.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)


        } catch let error1 as NSError {
            error = error1
            print(error)
        }

        player.play()
    }

    func stopSound() {
        player.stop()
        activeProgressView.setProgress(0, animated: false)
    }

    func trackAudio() {
        let normalizedTime = Float(player.currentTime / player.duration)
        activeProgressView.setProgress(normalizedTime, animated: true)
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
