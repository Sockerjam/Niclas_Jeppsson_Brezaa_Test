//
//  UserDetailsImpl.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

protocol UserPostDelegate {
    func updateUserPost(userData:[UserPosts])
}

class UserDetailsImpl {
    
    
    var delegate:UserPostDelegate?
    
    func networking(with address: String) {
    
        let request = URLRequest(url: URL(string: address)!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(error!)
                return
            }
            self.parseJSON(with: data)
        }
        
        task.resume()
    }
    
    
    private func parseJSON(with data:Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([UserPosts].self, from: data)
            self.delegate?.updateUserPost(userData: decodedData)
            
        } catch {
            print(error)
        }
        
    }
    
}
