//
//  CollectionViewCell.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 16/03/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var userName:UILabel = {
        let userName = UILabel()
        userName.font = UIFont.systemFont(ofSize: 20)
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    var userAvatar:UIImageView = {
       let userAvatar = UIImageView()
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        return userAvatar
    }()
    
    var userDetails:UIImageView = {
    let userDetails = UIImageView()
        userDetails.image = UIImage(systemName: "info.circle")
        userDetails.translatesAutoresizingMaskIntoConstraints = false
        return userDetails
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
    }
    
    func configure(userData:UserData, url:String){
        userName.text = userData.name
        userAvatar.imageFrom(url: URL(string: url)!)
//        userAvatar.image = UIImage(systemName: "person.circle")
    }
    
    private func setupConstraints(){
        
        addSubview(userAvatar)
        addSubview(userName)
        addSubview(userDetails)
        
        NSLayoutConstraint.activate([
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10), userAvatar.heightAnchor.constraint(equalToConstant: 40), userAvatar.widthAnchor.constraint(equalToConstant: 40), userAvatar.centerYAnchor.constraint(equalTo: centerYAnchor), userName.centerXAnchor.constraint(equalTo: centerXAnchor), userName.centerYAnchor.constraint(equalTo: centerYAnchor), userDetails.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10), userDetails.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
