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
        imageView.isUserInteractionEnabled = true
        imageView.tag = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // タッチイベントの検出
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "zoom")
                
                let zoomViewController:ZoomViewController = nextView as! ZoomViewController
                zoomViewController.zoom_count = count
               
                if flag == false{       //この条件をつけないと自動送りする前に拡大した時にエラーになる
                    timer.invalidate()
                    flag = true
                }
                
                self.present(nextView, animated: true, completion: nil)
                
            default:
                break
            }
        }
    }

    //戻るボタンの処理
    @IBAction func backImage(_ sender: UIButton) {
        if  flag == true{
            count -= 1
            if count == -1{
                count = 2
            }
            imageView.image = UIImage(named: imageArray[count])
        }
    }
    
    //進むボタンの処理
    @IBAction func goImage(_ sender: UIButton) {
        if flag == true{
            count += 1
            if count == 3{
                count = 0
            }
            imageView.image = UIImage(named: imageArray[count])
        }
    }
    

    //再生/停止ボタンの処理
    @IBAction func start_stopImage(_ sender: UIButton) {
        if  flag == true{
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
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
    
 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        zoomViewController.zoom_count = count
    }
 */

    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
}

