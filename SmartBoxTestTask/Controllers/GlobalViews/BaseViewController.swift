//
//  BaseViewController.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import JGProgressHUD
import UIKit

class BaseViewController: UIViewController {
    let hud = JGProgressHUD(style: .light)

    let hidesShadow = "hidesShadow"
    let sizeFont: CGFloat = 17

    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.setValue(true, forKey: hidesShadow)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .clear

        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
            NSAttributedString.Key.font: UIFont(name: R.font.sfProTextSemibold.fontName, size: sizeFont)!,
        ]
    }

    func showLoad() {
        hud.show(in: view)
    }

    func hideLoad() {
        hud.dismiss()
    }
}
