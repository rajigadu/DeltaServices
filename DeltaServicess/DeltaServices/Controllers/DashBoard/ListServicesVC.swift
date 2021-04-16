//
//  ListServicesVC.swift
//  DeltaServices
//
//  Created by rajesh gandru on 16/04/21.
//

import UIKit

class ListServicesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backbtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cartBtnref(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyCartPageVC") as! MyCartPageVC

        self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension ListServicesVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ServicesListCell = tableView.dequeueReusableCell(withIdentifier: "ServicesListCell", for: indexPath) as! ServicesListCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
