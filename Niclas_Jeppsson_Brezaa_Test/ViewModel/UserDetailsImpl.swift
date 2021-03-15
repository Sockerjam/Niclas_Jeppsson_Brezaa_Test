//
//  UserDetailsImpl.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

struct UserDetailsImpl:UserDetailsModel {
    
    private lazy var userInfo:[UserPosts] = []
    
    var userData: [UserPosts] {
        userInfo
    }
    
    func networking(with address: String) {
    
        let request = URLRequest(url: URL(fileURLWithPath: address))
        let task = URLSession.shared.dataTask(with: request) { data, error, response in
            guard let data = data else {
                print(error)
                return
            }
            parseJSON(with: data)
        }
        
        task.resume()
    }
    
    private func parseJSON(with data:Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([UserPosts].self, from: data)
            userInfo = decodedData
        } catch {
            print(error)
        }
    }
    
    func start(with dataSource: UICollectionViewDiffableDataSource<Section, UserData>) {
        <#code#>
    }
    
    
}
