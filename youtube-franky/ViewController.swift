//
//  ViewController.swift
//  youtube-franky
//
//  Created by franky on 08/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var response: Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Model.getVideo { response, error in
            
            DispatchQueue.main.async {
                self.response = response
            }
        }
    }

}

