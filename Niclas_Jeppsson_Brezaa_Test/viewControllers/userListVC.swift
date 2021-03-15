//
//  ViewController.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

class userListVC: UIViewController {
    
    

    private lazy var layout:UICollectionViewCompositionalLayout = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .white
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }()
    
    private lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User> {
        cell, indexPath, user in
        
        var content = cell.defaultContentConfiguration()
        content.text = user.username
        cell.contentConfiguration = content
        
    }
    
    
    private lazy var dataSource = UICollectionViewDiffableDataSource<Section, User>(collectionView: collectionView) {
        collectionView, indexPath, user in
        collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration, for: indexPath, item: user)
    }
    
    private var userInfoModel:UserInfoModel
    
    init(userInfoModel:UserInfoModel) {
        self.userInfoModel = userInfoModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationControllerSetup()
        setupView()
        userInfoModel.start(with: dataSource)
        
        view.backgroundColor = .white
        
    }
    
    private func navigationControllerSetup(){
        
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.backgroundColor = .orange
        navBarApperance.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance
        
    }
    
    private func setupView(){
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor), collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor), collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
    }


}

extension userListVC:UICollectionViewDelegate {
    
}

