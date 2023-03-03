//
//  ViewController.swift
//  Allen - Timer
//
//  Created by 박준서 on 2023/03/03.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let seconds = Int(sender.value * 60)
        mainLabel.text = "\(seconds)초"
        number = seconds
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomeThingAfter1Second), userInfo: nil, repeats: true)
    }
    
    @objc func doSomeThingAfter1Second(){
        
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number)초"
            
        }else{
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
    }
}

