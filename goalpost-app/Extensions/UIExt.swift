//
//  UIExt.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

extension UIButton{
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
    }
    func deSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.5)
    }
}
