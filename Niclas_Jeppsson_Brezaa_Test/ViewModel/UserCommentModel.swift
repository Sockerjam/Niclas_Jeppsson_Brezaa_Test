//
//  UserCommentDetailModel.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import Foundation

protocol UserCommentModel {
    
    var userData:[UserComments] { get }
    func networking(with address:String)
}
