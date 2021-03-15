//
//  UserDetailsVC.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

class UserDetailsVC: UIViewController {
    
    private lazy var layout:UICollectionViewCompositionalLayout = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .white
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }()
    
    private lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let userIcon:UIImageView = {
        let userIcon = UIImageView(frame: .zero)
        userIcon.image = UIImage(systemName: "person.circle")
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        return userIcon
    }()
    
    private let userInfo:UIStackView = {
        let userInfo = UIStackView()
        userInfo.backgroundColor = .white
        userInfo.axis = .vertical
        userInfo.distribution = .fillEqually
        userInfo.alignment = .center
        userInfo.translatesAutoresizingMaskIntoConstraints = false
        return userInfo
    }()
    
    var nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    var emailLabel:UILabel = {
        let emailLabel = UILabel()
        emailLabel.textColor = .black
        return emailLabel
    }()
    
    var addressLabel:UILabel = {
        let addressLabel = UILabel()
        addressLabel.textColor = .black
        return addressLabel
    }()
    
    init() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationControllerSetup()
        setupConstraints()
       
    }
    
    private func navigationControllerSetup(){
        let navApperance = UINavigationBarAppearance()
        navApperance.backgroundColor = .orange
        navApperance.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = navApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navApperance
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupConstraints() {
        
        view.addSubview(userIcon)
        view.addSubview(userInfo)
        userInfo.addArrangedSubview(nameLabel)
        userInfo.addArrangedSubview(emailLabel)
        userInfo.addArrangedSubview(addressLabel)
        
        NSLayoutConstraint.activate([userIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), userIcon.heightAnchor.constraint(equalToConstant: 75), userIcon.widthAnchor.constraint(equalToConstant: 75), userIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor), userInfo.topAnchor.constraint(equalTo: userIcon.bottomAnchor), userInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor), userInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor), userInfo.heightAnchor.constraint(equalToConstant: 100)])
    }

}
