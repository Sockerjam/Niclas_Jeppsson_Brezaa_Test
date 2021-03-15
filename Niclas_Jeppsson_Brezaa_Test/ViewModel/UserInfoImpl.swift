//
//  UserInfoImpl.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

class UserInfoImpl:UserInfoModel {
    
    private lazy var userInfo:[UserData] = []
    
    var userData:[UserData] {
        userInfo
    }
    
    private var dataSource:UICollectionViewDiffableDataSource<Section, UserData>?
    
    func start(with dataSource: UICollectionViewDiffableDataSource<Section, UserData>) {
        self.dataSource = dataSource
    }
    
    func networking(with urlAddress:String) {
        
       let request = URLRequest(url: URL(string: urlAddress)!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print(error)
                return
            }
            self.parseJSON(with: data)
        }
        
        task.resume()
    }
    
    private func parseJSON(with data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([UserData].self, from: data)
            userInfo = decodedData
        } catch {
            print(error)
        }
        
        snapShot(userData: userData)
    }
    
    private func snapShot(userData:[UserData]){
        var snapShot = NSDiffableDataSourceSnapshot<Section, UserData>()
        
        snapShot.appendSections([.main])
        snapShot.appendItems(userData)
        dataSource?.apply(snapShot)
    }
    
}
