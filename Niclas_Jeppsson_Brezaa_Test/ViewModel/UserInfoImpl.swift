//
//  UserInfoImpl.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import Foundation

class UserInfoImpl:UserInfoModel {
    
    private var dataSource:UICollectionViewDiffableDataSource<Section, User>?
    
    func start(with dataSource: UICollectionViewDiffableDataSource<Section, User>) {
        self.dataSource = dataSource
    }
    
    func networking(with address:String) {
        
        let url = address
    }
    
    
    
}
