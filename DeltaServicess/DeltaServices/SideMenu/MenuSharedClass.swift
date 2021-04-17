//
//  menuSharedClass.swift
//  menuMission
//
//  Created by osx on 01/11/17.
//  Copyright © 2017 osx. All rights reserved.
//

import UIKit


class sharedMenuClass:NSObject {
    
    var menuView = MenuClassView()
    static let menuObj = sharedMenuClass()
    private override init() {
        super.init()
    }
    func addMenuClass(view:UIView)
    {
        self.menuView.frame = view.frame
        view.addSubview(self.menuView)
        self.menuView.frame.origin.x = -1 * UIScreen.main.bounds.size.width
        UIView.animate(withDuration: 0.30, animations: { () -> Void in
            self.menuView.frame.origin.x = 0
            self.menuView.rightButtonOut.alpha = 0.60
            self.menuView.layoutIfNeeded()
        }, completion: { (finished) -> Void in

        })
        
    }
    func touchEventsOnMainClass(view:UIView) {
        
        UIView.animate(withDuration: 0.7, animations: { () -> Void in
            self.menuView.frame.origin.x = -1 * UIScreen.main.bounds.size.width
            self.menuView.rightButtonOut.alpha = 0
            self.menuView.layoutIfNeeded()
        }, completion: { (finished) -> Void in
            self.menuView.removeFromSuperview()
        })
        
    }
}
