//
//  UserDetailsModel.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

protocol UserDetailsModel {
    
    var userData:[UserPosts]{ get }
    func networking(with address:String)
    func start(with dataSource:UICollectionViewDiffableDataSource<Section, UserPosts>)
}
