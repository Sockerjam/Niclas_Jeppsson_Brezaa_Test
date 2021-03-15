//
//  UserInfo.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

protocol UserInfoModel {
    
    
    func networking()
    func start(with dataSource:UICollectionViewDataSource<Section, UserData>)
    
}

