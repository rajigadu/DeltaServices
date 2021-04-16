//
//  DashBoardVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 15/04/21.
//

import UIKit

class DashBoardVC: UIViewController {
    
    @IBOutlet weak var timeLblref: UILabel!
    @IBOutlet weak var newBookingsViewref: UIView!
    @IBOutlet weak var myTransactionViewref: UIView!
    @IBOutlet weak var myBookingsViewref: UIView!
    @IBOutlet weak var settingsViewref: UIView!
    
    
    lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a" // or "hh:mm a" if you need to have am or pm symbols
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.newBookingsViewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.1568627451, green: 0.1450980392, blue: 0.3803921569, alpha: 1),
                                                      alpha: 0.38,
                                                      x: 0, y: 3,
                                                      blur: 10,
                                                      spread: 0,
                                                      cornerRadiusValue: 4)
        self.myTransactionViewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.1568627451, green: 0.1450980392, blue: 0.3803921569, alpha: 1),
                                                      alpha: 0.38,
                                                      x: 0, y: 3,
                                                      blur: 10,
                                                      spread: 0,
                                                      cornerRadiusValue: 4)
        self.myBookingsViewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.1568627451, green: 0.1450980392, blue: 0.3803921569, alpha: 1),
                                                      alpha: 0.38,
                                                      x: 0, y: 3,
                                                      blur: 10,
                                                      spread: 0,
                                                      cornerRadiusValue: 4)
        self.settingsViewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.1568627451, green: 0.1450980392, blue: 0.3803921569, alpha: 1),
                                                      alpha: 0.38,
                                                      x: 0, y: 3,
                                                      blur: 10,
                                                      spread: 0,
                                                      cornerRadiusValue: 4)
        
        self.getCurrentTime()
        let now = Date()
        let date = Calendar.current.date(bySettingHour: Calendar.current.component(.hour, from: now), minute: Calendar.current.component(.minute, from: now) + 1, second: 0, of: now)!
        let timer = Timer(fire: date, interval: 60, repeats: true) { _ in
            self.getCurrentTime()
        }
        
        
    }
    func getCurrentTime() {
        self.timeLblref.text = formatter.string(from: Date())
    }


    @IBAction func newBookingbtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerifyZipCodeVC") as! VerifyZipCodeVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
