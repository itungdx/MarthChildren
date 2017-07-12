//
//  ViewHome.swift
//  MathChildren
//
//  Created by Tung on 6/16/17.
//  Copyright © 2017 Tung. All rights reserved.
//

import UIKit

class ViewHome: UIViewController {
    @IBOutlet weak var lbl_cal: UILabel!
    @IBOutlet weak var lbl_time: UILabel!
    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var lbl_textTime: UILabel!
    @IBAction func slider_time(_ sender: UISlider) {
        lbl_textTime.text = String(Int(sender.value))
    }

    @IBAction func btn_Exit(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            self.visualEffectView.isHidden = true
            self.btn_Setting_Outlet.isHidden = false
        }){
            (success:Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    @IBOutlet weak var btn_Setting_Outlet: UIButton!
    @IBAction func btn_Setting(_ sender: UIButton) {
        btn_Setting_Outlet.isHidden = true
        addItemView.isHidden = false
        visualEffectView.isHidden = false
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.layer.cornerRadius = 15
        addItemView.alpha = 1
    }
    let caculation = ["+","-","*","/"]
    let time = [10,30,60,90]
    override func viewDidLoad() {
        super.viewDidLoad()
        addItemView.isHidden = true
        visualEffectView.isHidden = true


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
