
//  ViewController.swift
//  MathChildren
//
//  Created by Tung on 6/7/17.
//  Copyright © 2017 Tung. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    @IBOutlet weak var lbl_p3: UILabel!
    @IBOutlet weak var btn_b1: UIButton!
    @IBOutlet weak var btn_b2: UIButton!
    @IBOutlet weak var btn_b3: UIButton!
    @IBAction func btn_acction(_ sender: UIButton) {
        CheckResult(_sender: sender)
        setRandom()
        //Can kiem tra ket qua truoc khi tao ngau nhien 2 so
    }
    @IBOutlet weak var lbl_True: UILabel!
    @IBOutlet weak var lbl_Time: UILabel!
    @IBOutlet weak var lbl_False: UILabel!
    @IBOutlet weak var VisualEffect: UIVisualEffectView!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var lbl_numScore: UILabel!
    @IBOutlet weak var btn_Replay: UIButton!
    
    
    @IBOutlet var addItemView: UIView!
    @IBAction func btn_acc_Replay(_ sender: UIButton) {
        rePlay()
    }
    
    var time:Int = 11
    var timer = Timer()
    var lbl_Result: Int!
    var effect: UIVisualEffect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VisualEffect.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.Countdown), userInfo: nil, repeats: true)
//        timer.invalidate()
        // timer.invalidate la dieu kien dung cua timer.ScheduledTime
        setRandom()
    }
    func setRandom(){
        //Random 2 so
        let random1 = Int(arc4random_uniform(9))+1
        //+1 de khong random ra so 0
        //arc4random_uniform(4) la random ra so tu 0-3
        let random2 = Int(arc4random_uniform(9))+1
//        print(random1)
//        print(random2)
        //hien thi 2 so
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        
        print("KQ: \(lbl_Result)")
        setResult(randomA: random1, randomB: random2)
        lbl_Result = Int(Int(lbl_p1.text!)!+Int(lbl_p2.text!)!)
    }
    //Random ket qua khac nhau
    
    //???
    func setResult(randomA: Int, randomB: Int){
        let random = Int(arc4random_uniform(3))
        let result = getResult()
        var random1 = Int(arc4random_uniform(18))+1
        var random2 = Int(arc4random_uniform(18))+1
        
        while (random1 == random2 || random1 == result || random2 == result) {
            random1 = Int(arc4random_uniform(18))+1
            random2 = Int(arc4random_uniform(18))+1
        }
        
        switch random {
        case 0:
            btn_b1.setTitle(String(sum(p1: randomA, p2: randomB)), for: UIControlState.normal)
            btn_b2.setTitle(String(random1), for: .normal)
            btn_b3.setTitle(String(random2), for: .normal)
            break

        case 1:
            btn_b2.setTitle(String(sum(p1: randomA, p2: randomB)), for: UIControlState.normal)
            btn_b1.setTitle(String(random1), for: .normal)
            btn_b3.setTitle(String(random2), for: .normal)
            break
            
        case 2:
            btn_b3.setTitle(String(sum(p1: randomA, p2: randomB)), for: UIControlState.normal)
            btn_b1.setTitle(String(random1), for: .normal)
            btn_b2.setTitle(String(random2), for: .normal)
            break
            
        default: print("xxx")
        }
//        btn_b1.setTitle(String(randomA), for: UIControlState.normal)
//        btn_b2.setTitle(String(randomB), for: UIControlState.normal)
//        btn_b3.setTitle(String(sum(p1: randomA, p2: randomB)), for: UIControlState.normal)
    }
    //Tinh tong
    func getResult() -> Int{
        var Result: Int = 0
        Result = sum(p1: Int(lbl_p1.text!)!, p2: Int(lbl_p2.text!)!)
        return Result
    }
    func sum(p1:Int,p2:Int)->Int {
        return p1+p2
    }
    //Sau dau -> la co kieu tra ve
//    func TimeStart(){
//        var time: Int
//        time = 90
//    }
    func Countdown(){
        time = (time - 1)
        lbl_Time.text = String(time)
        if time == 0 {
            lbl_Time.text = "10"
            timer.invalidate()
            VisualEffect.isHidden = false
            popUpResult()
            
            //dung thao tac nhan cua nguoi dung
//            btn_b1.isHidden = true
//            btn_b1.isUserInteractionEnabled = false
//            btn_b2.isUserInteractionEnabled = false
//            btn_b3.isUserInteractionEnabled = false
            //nham dung vong lap, o day nham muc dich nham dungf lap Countdow de time >=0
            
        }
    }
    
    func CheckResult(_sender: UIButton)-> String{
        print("currentTitle: \(_sender.currentTitle)")
        print("Title: \(_sender.title(for: .normal))")
        print(lbl_Result)
        if (Int(_sender.currentTitle!)! == lbl_Result) {
            lbl_True.text = String(Int(lbl_True.text!)!+1)
            return lbl_True.text!
        }else{
            lbl_False.text = String(Int(lbl_False.text!)!+1)
            return lbl_False.text!
        }
    }
    
    func popUpResult(){
        addItemView.isHidden = false
        addItemView.layer.cornerRadius = 15
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 1
        lbl_numScore.text = lbl_True.text
    }
    // phuong thuc choi lai
    func rePlay(){
        addItemView.isHidden = true
        VisualEffect.isHidden = true
        time = 10
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.Countdown), userInfo: nil, repeats: true)
        setRandom()
        //reset Result
        lbl_True.text = "0"
        lbl_False.text = "0"
    }
}


