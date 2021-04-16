//
//  VerifyZipCodeVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 16/04/21.
//

import UIKit

class VerifyZipCodeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
     }
    
    @IBAction func verifyZipCodebtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListServicesVC") as! ListServicesVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cartBtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyCartPageVC") as! MyCartPageVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
