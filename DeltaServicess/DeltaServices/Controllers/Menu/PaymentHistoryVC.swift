//
//  PaymentHistoryVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 17/04/21.
//

import UIKit

class PaymentHistoryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnActionMenu(_ sender: Any) {
             sharedMenuClass.menuObj.addMenuClass(view: self.view)
             sharedMenuClass.menuObj.menuView.delegate = self
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
extension PaymentHistoryVC : MenuDelegate{
    func callMethod1(vcIndex: Int) {
        navigationClass(index:vcIndex)
    }
    func MenuMethods() {
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        self.view.addGestureRecognizer(edgePan)
    }
    
    @objc func screenEdgeSwiped(sender:UIScreenEdgePanGestureRecognizer) {
        
        if sender.edges == .left {
            sharedMenuClass.menuObj.addMenuClass(view: self.view)
            sharedMenuClass.menuObj.menuView.delegate = self
        }
        else if sender.edges == .right {
            
        }
    }
    
    func callMethod(vcIndex:Int) {
        navigationClass(index:vcIndex)
    }
    
    func touchEvents(_ direction:String) {
        if direction == "left" {
            sharedMenuClass.menuObj.touchEventsOnMainClass(view: self.view)
        }
        if direction == "right" {
            sharedMenuClass.menuObj.touchEventsOnMainClass(view: self.view)
        }
    }
    
}
