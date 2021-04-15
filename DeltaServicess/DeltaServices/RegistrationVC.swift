//
//  RegistrationVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 15/04/21.
//

import UIKit

class RegistrationVC: UIViewController {
    @IBOutlet weak var emailTfref: UITextField!
    @IBOutlet weak var phoneTfref: UITextField!
    @IBOutlet weak var addressTfref: UITextField!
    @IBOutlet weak var cityTFref: UITextField!
    @IBOutlet weak var stateTfref: UITextField!
    @IBOutlet weak var pincodeTfref: UITextField!
    @IBOutlet weak var passwordTfref: UITextField!
    
    @IBOutlet weak var confirmPassTfref: UITextField!
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

    @IBAction func sentOtpbtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
     }
    
    @IBAction func signbtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
     }
}
