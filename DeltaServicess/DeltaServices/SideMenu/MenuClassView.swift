//
//  MenuClassView.swift
//  JalfApp
//
//  Created by osx on 29/12/17.
//  Copyright © 2017 osx. All rights reserved.
//

import UIKit
//import TrueTime
//import CRNotifications

protocol MenuDelegate {
    func callMethod(vcIndex:Int)
    func touchEvents(_ direction:String)
}

let kNotificationMenuChanged = NSNotification.Name(rawValue:"kNotificationMenuChanged")
class MenuClassView: UIView,UITableViewDelegate,UITableViewDataSource{
    
    var expandedSectionHeaderNumber: Int = -1
    var expandedSectionHeader: UITableViewHeaderFooterView!
    let kHeaderSectionTag: Int = 6900;
    var collpseSection :Int = -1
    var delegate : MenuDelegate? = nil
    
    
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblSerialNo:UILabel!
    @IBOutlet weak var rightButtonOut: UIButton!
    @IBOutlet var customeView :UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView2: UITableView!
    
    
    
    var menuClass = [MenuClass]()
    
    var userNm =  ""
    var serialNo = ""
    
    var VcInfo:[String] = []
    var VcIcons:[String] = []
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBAction func cmdNotificationBadage(_ sender: Any) {
        
    }
    
    func initializingForMenu() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveMenuChangedNotification), name: kNotificationMenuChanged, object: nil)
        VcIcons = ["ProfileEdit","Changepassword","Orders","Subscriptions","PaymentHistory","Coupons","LogOut"]
        VcInfo = ["Profile Edit","Change password","Orders","Subscriptions","Payment History","Coupons","LogOut"]
        menuClass.removeAll()
        menuClass.append(MenuClass(sectionName: VcInfo[0], rowsInSections: [],selected:false))
        menuClass.append(MenuClass(sectionName: VcInfo[1], rowsInSections: [],selected:false))
        menuClass.append(MenuClass(sectionName: VcInfo[2], rowsInSections: [],selected:false))
        menuClass.append(MenuClass(sectionName: VcInfo[3], rowsInSections: [],selected:false))
        menuClass.append(MenuClass(sectionName: VcInfo[4], rowsInSections: [],selected:false))
        menuClass.append(MenuClass(sectionName: VcInfo[5], rowsInSections: [],selected:false))
        menuClass.append(MenuClass(sectionName: VcInfo[6], rowsInSections: [],selected:false))

        
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        initializingForMenu()
        Bundle.main.loadNibNamed("menu", owner: self, options: nil)
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height)
        customeView.frame = self.frame
        addSubview(customeView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        
        self.customeView.addGestureRecognizer(swipeLeft)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MenuCellX", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        rightButtonOut.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
        
        userNm =  UserDefaults.standard.string(forKey: "userName") ?? ""
        serialNo =  UserDefaults.standard.string(forKey: "sreialNo") ?? ""
        if userNm != nil{
            lblName.text = "Name: \(userNm)"
            lblSerialNo.text = "Serial No: \(serialNo ?? "")"
        }
        
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            delegate?.touchEvents("right")
        case UISwipeGestureRecognizer.Direction.down:
            delegate?.touchEvents("down")
        case UISwipeGestureRecognizer.Direction.left:
            delegate?.touchEvents("left")
        case UISwipeGestureRecognizer.Direction.up:
            delegate?.touchEvents("up")
        default:
            break
        }
    }
    
    @objc func buttonTouched(sender:UIButton) {
        delegate?.touchEvents("right")
        
    }
    @objc func receiveMenuChangedNotification(notification:NSNotification) {
        
        if notification.name == kNotificationMenuChanged {
            userNm =  UserDefaults.standard.string(forKey: "userName") ?? ""
            serialNo =  UserDefaults.standard.string(forKey: "sreialNo") ?? ""
            if userNm != nil{
                lblName.text = "Name: \(userNm)"
                lblSerialNo.text = "Serial No: \(serialNo ?? "")"
            }
            
            initializingForMenu()
            tableView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if collpseSection == section && menuClass[section].selected{
            return menuClass[section].rowsInSections.count
        }else {
            return 0
        }
        
        //return VcInfo.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuClass.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.current.userInterfaceIdiom == .phone{
            
            return tableView.frame.height/9
        }
        return tableView.frame.height / 6
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //print("screenType:", UIDevice.current.screenType)
        
        switch UIDevice.current.screenType {
        case .iPhones_5_5s_5c_SE:
            return 50
        case .iPhones_6_6s_7_8:
            return 50
        default:
            return 70
        }
        
        
        
    }
    @objc func sectionHeaderWasTouched(_ sender: UIButton) {
        
        guard let tag = sender.tag as? Int  else {
            return
        }
        print(tag)
        //        if tag != 5 {
        // navigate to the screen
        delegate?.callMethod(vcIndex:tag)
        //        }
        menuClass[tag].selected = !menuClass[tag].selected
        collpseSection = tag
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuCustCell
        cell.label.text = menuClass[section].sectionName
        cell.backgroundColor = UIColor.clear
        cell.tag = section
        cell.buttonTapOut.tag = section
        cell.buttonTapOut.addTarget(self, action: #selector(sectionHeaderWasTouched), for: .touchUpInside)
        cell.icon.image = UIImage(named: VcIcons[section])
        return cell.contentView
        
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCustCell
        cell.selectionStyle = .none
        cell.label.text = menuClass[indexPath.section].rowsInSections[indexPath.row]
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        
        return cell
        
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 ||  indexPath.row == 1 ||  indexPath.row == 2 ||  indexPath.row == 3{
            delegate?.callMethod(vcIndex:indexPath.row)
        } else {
        }
    }
}

extension UIViewController {
    func navigationClass(index:Int) {
        sharedMenuClass.menuObj.touchEventsOnMainClass(view: self.view)
        
        var Vc = UIViewController()
        if index == 6{
            let alert = UIAlertController(title: "Logout?", message: "Are your sure want to logout?",  preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "NO", style: UIAlertAction.Style.destructive, handler: { _ in
                //Cancel Action
            }))
            alert.addAction(UIAlertAction(title: "YES",
                                          style: UIAlertAction.Style.default,
                                          handler: {(_: UIAlertAction!) in
                                            self.hitLogOutuserApi {
                                                //UserDefaults.standard.removeObject(forKey: "userName")
                                                // UserDefaults.standard.removeObject(forKey: "sreialNo")
                                                if let appDomain = Bundle.main.bundleIdentifier {
                                                    UserDefaults.standard.removePersistentDomain(forName: appDomain)
                                                    // UserDefaults.resetStandardUserDefaults()
                                                    UserDefaults.standard.synchronize()
                                                    
                                                }
                                               // self.moveToNextVC(id: "LoginVC")
//                                                let customNotification = CustomCRNotification(textColor: .white, backgroundColor: #colorLiteral(red: 0.1991459131, green: 0.4210355878, blue: 0.7273264527, alpha: 1), image:#imageLiteral(resourceName: "Successful"))
//                                                UserDefaults.standard.set("", forKey: "userName")
//                                                UserDefaults.standard.set("", forKey: "userID")
//                                                UserDefaults.standard.set("", forKey: "sreialNo")
//                                                Proxy.shared.displayCRNotificationAlert(type: customNotification, title: "Success!", message: "Logged Out Successfully")
                                                
                                                
                                                Vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangepasswordVC") as! ChangepasswordVC
                                                
                                                
                                                var vcArray = self.navigationController?.viewControllers
                                                vcArray?.removeLast()
                                                vcArray?.append(Vc)
                                                DispatchQueue.main.async {
                                                    self.navigationController?.setViewControllers(vcArray!, animated: true)}

                                            }
                                            
                                          }))
            
            self.present(alert, animated: true, completion: nil)
            
        } else{
            switch index {
            case 0:
                Vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileEditVC") as! ProfileEditVC
            case 1:
                Vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangepasswordVC") as! ChangepasswordVC
            case 2:
                Vc = self.storyboard?.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
            case 3:
                Vc = self.storyboard?.instantiateViewController(withIdentifier: "SubscriptionsVC") as! SubscriptionsVC
            case 4:
                
                    Vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentHistoryVC") as! PaymentHistoryVC
            case 5:
                    Vc = self.storyboard?.instantiateViewController(withIdentifier: "CouponsVC") as! CouponsVC
                    
                
            default:
                break
            }
            var vcArray = self.navigationController?.viewControllers
            vcArray?.removeLast()
            vcArray?.append(Vc)
            DispatchQueue.main.async {
                self.navigationController?.setViewControllers(vcArray!, animated: true)}
        }
    }
    
    //LogOut Api Calling
    func hitLogOutuserApi(_ completion: @escaping () -> Void){
        let userId =  UserDefaults.standard.string(forKey: "userID")
        let param = ["uid": userId] as [String : Any]
        
        //    Proxy.shared.postData(Apis.KserverUrl+Apis.KuserLogout, params: param , showIndicator: true) {
        //            (response) in
        //
        //         completion()
        //        }
        
    }
    
}

class MenuClass {
    
    var sectionName = String()
    var rowsInSections = [String]()
    var selected = Bool()
    
    init(sectionName:String,rowsInSections:[String],selected:Bool) {
        self.sectionName = sectionName
        self.rowsInSections = rowsInSections
        self.selected = selected
    }
}





class viewTest: UIView{
    
}
