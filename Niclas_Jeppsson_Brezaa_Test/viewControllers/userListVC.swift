//
//  ViewController.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

class userListVC: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationControllerSetup()
        
    }
    
    private func navigationControllerSetup(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .orange
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key:UIColor.white]
        
    }


}

