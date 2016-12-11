//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 佐々井健吾 on 2016/12/11.
//  Copyright © 2016年 kenren. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var zoomImageView: UIImageView!
    
    var zoom_count = 0
    var imageArray = ["1.png", "2.png", "3.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        zoomImageView.image = UIImage(named: imageArray[zoom_count])

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
