//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐々井健吾 on 2016/12/09.
//  Copyright © 2016年 kenren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var start_stopButton: UIButton!

    var imageArray = ["1.png", "2.png", "3.png"]
    var count = 0
    var timer: Timer!
    var flag = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageArray[0])
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    //戻るボタンの処理
    @IBAction func backImage(_ sender: UIButton) {
        count -= 1
        if count == -1{
            count = 2
        }
        imageView.image = UIImage(named: imageArray[count])
    }
    
    //進むボタンの処理
    @IBAction func goImage(_ sender: UIButton) {
        count += 1
        if count == 3{
            count = 0
        }
        imageView.image = UIImage(named: imageArray[count])
    }

    //再生/停止ボタンの処理
    @IBAction func start_stopImage(_ sender: UIButton) {
        if  flag == true{
            timer.fire()
        }else if flag == false{
            timer.invalidate()
        }
        flag = !flag
        
    }
    func update(tm: Timer) {
        count += 1
        if count == 3{
            count = 0
        }
        imageView.image = UIImage(named: imageArray[count])
    }

}

