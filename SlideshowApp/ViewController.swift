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

    var imageArray = ["1.png", "2.png", "3.png"]
    var count = 0
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageArray[0])
        // Do any additional setup after loading the view, typically from a nib.
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

    

}

