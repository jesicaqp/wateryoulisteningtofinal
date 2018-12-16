//
//  TrackViewController.swift
//  water you listening to
//
//  Created by Jesica Quinones on 12/12/18.
//  Copyright © 2018 Jesica Quinones. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController {
    
        @IBOutlet weak var timerLabel: UILabel!
        let defaults = UserDefaults.standard
        var countdownTimer: Timer!
        var totalTime = 0
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        func startTimer() {
            totalTime = defaults.integer(forKey: "goal")*60
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        
    @objc func updateTime() {
            timerLabel.text = "\(timeFormatted(totalTime))"
            
            if totalTime != 0 {
                totalTime -= 1
            } else {
                endTimer()
            }
        }
        
        func endTimer() {
            countdownTimer.invalidate()
        }
        
        func timeFormatted(_ totalSeconds: Int) -> String {
            let seconds: Int = totalSeconds % 60
            let minutes: Int = (totalSeconds / 60) % 60
            //     let hours: Int = totalSeconds / 3600
            return String(format: "%02d:%02d", minutes, seconds)
        }
        
    @IBAction func restart(_ sender: UIButton) {
        timerLabel.text = String(defaults.integer(forKey: "goal"))
    }
    
    @IBAction func done(_ sender: Any) {
        let doneTime = timeFormatted(totalTime)
        defaults.set(doneTime, forKey: "curr")
    }
   
        @IBAction func startTimerPressed(_ sender: UIButton) {
            startTimer()
        }
        
    }
//    let defaults = UserDefaults.standard
//    //MARK: - IBOutlets
//    @IBOutlet weak var startButton: UIButton!
//    @IBOutlet weak var pauseButton: UIButton!
//    @IBOutlet weak var timerLabel: UILabel!
//
//    var seconds = 0
//    var timer = Timer()
//
//    var isTimerRunning = false
//    var resumeTapped = false
//
//    func setSec() {
//        seconds = defaults.integer(forKey: "goal")*60
//    }
//
//    //MARK: - IBActions
//    @IBAction func startButtonTapped(_ sender: UIButton) {
//        setSec()
//        if isTimerRunning == false {
//            runTimer()
//            self.startButton.isEnabled = false
//        }
//    }
//
//    func runTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TrackViewController.updateTimer)), userInfo: nil, repeats: true)
//        isTimerRunning = true
//        pauseButton.isEnabled = true
//    }
//
//    @IBAction func pauseButtonTapped(_ sender: UIButton) {
//        if self.resumeTapped == false {
//            timer.invalidate()
//            isTimerRunning = false
//            self.resumeTapped = true
//            self.pauseButton.setTitle("Resume",for: .normal)
//        } else {
//            runTimer()
//            self.resumeTapped = false
//            isTimerRunning = true
//            self.pauseButton.setTitle("Pause",for: .normal)
//        }
//    }
//
//    @IBAction func resetButtonTapped(_ sender: UIButton) {
//        timer.invalidate()
//        seconds = defaults.integer(forKey: "goal")*60
//        timerLabel.text = timeString(time: TimeInterval(defaults.integer(forKey: "goal")*60))
//        isTimerRunning = false
//        pauseButton.isEnabled = false
//        startButton.isEnabled = true
//    }
//
//
//    @objc func updateTimer() {
//        if seconds < 1 {
//            timer.invalidate()
//            //Send alert to indicate time's up.
//        } else {
//            seconds -= 1
//            timerLabel.text = timeString(time: TimeInterval(seconds))
//            timerLabel.text = String(seconds)
//            //            labelButton.setTitle(timeString(time: TimeInterval(seconds)), for: UIControlState.normal)
//        }
//    }
//
//    func timeString(time:TimeInterval) -> String {
//        let hours = Int(time) / 3600
//        let minutes = Int(time) / 60 % 60
//        let seconds = Int(time) % 60
//        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
//    }
//
//    //MARK: - Super Methods
//    override func viewDidLoad() {
//        seconds = defaults.integer(forKey: "goal")*60
//        print(defaults.integer(forKey: "goal")*60)
//        super.viewDidLoad()
//
//
//        pauseButton.isEnabled = false
//    }
//}

