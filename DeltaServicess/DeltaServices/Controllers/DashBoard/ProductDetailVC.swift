//
//  ProductDetailVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 16/04/21.
//

import UIKit

class ProductDetailVC: UIViewController {
    @IBOutlet weak var ProductBackvewref: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProductBackvewref.layer.applyCornerRadiusShadow(color: #colorLiteral(red: 0.1568627451, green: 0.1450980392, blue: 0.3803921569, alpha: 1),
                                                      alpha: 0.38,
                                                      x: 0, y: 3,
                                                      blur: 10,
                                                      spread: 0,
                                                      cornerRadiusValue: 4)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backbtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
     }
    
    @IBAction func addCartbtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyCartPageVC") as! MyCartPageVC

        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func BuyNowbtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderSummaryVC") as! OrderSummaryVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cartBtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyCartPageVC") as! MyCartPageVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
