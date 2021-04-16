//
//  DashBoardVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 15/04/21.
//

import UIKit

class DashBoardVC: UIViewController {
    
    @IBOutlet weak var newBookingsViewref: UIView!
    @IBOutlet weak var myTransactionViewref: UIView!
    @IBOutlet weak var myBookingsViewref: UIView!
    @IBOutlet weak var settingsViewref: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.newBookingsViewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.1568627451, green: 0.1450980392, blue: 0.3803921569, alpha: 1),
                                                      alpha: 0.38,
                                                      x: 0, y: 3,
                                                      blur: 10,
                                                      spread: 0,
                                                      cornerRadiusValue: 4)
        self.myTransactionViewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.9098039216, green: 0.6549019608, blue: 0.2039215686, alpha: 1),
                                                      alpha: 0.38,
                                                      x: 0, y: 3,
                                                      blur: 10,
                                                      spread: 0,
                                                      cornerRadiusValue: 4)
//        self.newBookingsViewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.9098039216, green: 0.6549019608, blue: 0.2039215686, alpha: 1),
//                                                      alpha: 0.38,
//                                                      x: 0, y: 3,
//                                                      blur: 10,
//                                                      spread: 0,
//                                                      cornerRadiusValue: 4)
//        self.newBookingsViewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.9098039216, green: 0.6549019608, blue: 0.2039215686, alpha: 1),
//                                                      alpha: 0.38,
//                                                      x: 0, y: 3,
//                                                      blur: 10,
//                                                      spread: 0,
//                                                      cornerRadiusValue: 4)
        
        
    }
    


   

}
