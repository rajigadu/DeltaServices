//
//  ForgotPasswordVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 15/04/21.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var Emailtfref: UITextField!
    @IBOutlet weak var backViewref: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backViewref.layer.applyCornerRadiusShadow(color: .black,
                                                      alpha: 0.38,
                                                      x: 0, y: 3,
                                                      blur: 10,
                                                      spread: 0,
                                                      cornerRadiusValue: 4)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendOtpbtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
     }
   
    @IBAction func SignInbtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
