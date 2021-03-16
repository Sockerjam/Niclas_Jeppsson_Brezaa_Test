//
//  Extensions.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 16/03/2021.
//

import UIKit

extension UIImageView {
    func imageFrom(url:URL){
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self?.image = image
                }
                }
            }
        }
    }
}
