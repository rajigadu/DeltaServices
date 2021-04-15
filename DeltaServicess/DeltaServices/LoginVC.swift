//
//  LoginVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 15/04/21.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var backViewref: UIView!

    @IBOutlet weak var Passwordtfref: UITextField!
    @IBOutlet weak var Emailtfref: UITextField!
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
    

    @IBAction func forgotBtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func LoginBtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashBoardVC") as! DashBoardVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func SignUpbtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
