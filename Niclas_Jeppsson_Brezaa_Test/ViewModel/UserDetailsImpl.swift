//
//  UserDetailsImpl.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

class UserDetailsImpl: UserDetailsModel {

    
    private var dataSource:UICollectionViewDiffableDataSource<Section, UserPosts>?
    
    var userInfo:[UserPosts] = []
    
    var userData:[UserPosts] {
        userInfo
    }
    
    func start(with dataSource: UICollectionViewDiffableDataSource<Section, UserPosts>) {
        self.dataSource = dataSource
    }
    
    func networking(with address: String) {
    
        let request = URLRequest(url: URL(string: address)!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(error)
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
            userInfo = decodedData
        } catch {
            print(error)
        }
        
        print(userData.count)
        
        snapShot(userData: userData)
    }
    
    private func snapShot(userData:[UserPosts]){
        var snapShot = NSDiffableDataSourceSnapshot<Section, UserPosts>()
        snapShot.appendSections([.main])
        snapShot.appendItems(userData)
        dataSource?.apply(snapShot)
    }
    
}
