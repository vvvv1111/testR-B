//
//  LoadViewController.swift
//  testR&B
//
//  Created by Vladimir on 27.11.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit


class LoadViewController: UIViewController {
    
    var delegate: isPageLoadedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.6274509804, blue: 0.8941176471, alpha: 1)
        delegate?.openPage()
        setLabel()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func setLabel(){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        label.center = self.view.center
        label.textAlignment = .center
        label.font = label.font.withSize(50)
        label.text = "LOADING..."
        label.textColor = UIColor.white
        self.view.addSubview(label)
    }
    
}
