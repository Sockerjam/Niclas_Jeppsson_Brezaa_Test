//
//  UserCommentImpl.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import Foundation

protocol UserCommentsDelegate {
    func updateUserComments(userComments:[UserComments])
}

class UserCommentImpl {
    
    var delegate:UserCommentsDelegate?
    
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
            let decodedData = try decoder.decode([UserComments].self, from: data)
            delegate?.updateUserComments(userComments: decodedData)
        } catch {
            print(error)
        }
    }
    
    
    
}
