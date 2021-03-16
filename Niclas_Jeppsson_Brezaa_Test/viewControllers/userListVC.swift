//
//  ViewController.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

class userListVC: UIViewController {
    
    let userDetailVC = UserDetailsVC(userDetailsImpl: UserDetailsImpl(), userCommentImpl: UserCommentImpl())

    private lazy var layout:UICollectionViewCompositionalLayout = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .white
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }()
    
    private lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reusableCell")
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var dataSource = UICollectionViewDiffableDataSource<Section, UserData>(collectionView: collectionView) {
        collectionView, indexPath, user in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath) as! CollectionViewCell
        cell.configure(userData: user, url: Constants.userIconApi)
        return cell
    }
    
    private var userInfoModel:UserInfoModel
    
    init(userInfoModel:UserInfoModel, userDetailsImpl:UserDetailsImpl, userCommentImpl: UserCommentImpl) {
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
        userInfoModel.networking(with: Constants.userApi)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        userDetailVC.selectedUser = indexPath.item + 1
        userDetailVC.title = "Username: \(userInfoModel.userData[indexPath.item].username)"
        userDetailVC.nameLabel.text = "Name: \(userInfoModel.userData[indexPath.item].name)"
        userDetailVC.addressLabel.text = "City: \(userInfoModel.userData[indexPath.item].address.city)"
        userDetailVC.emailLabel.text = "Email: \(userInfoModel.userData[indexPath.item].email)"
        
        navigationController?.pushViewController(userDetailVC, animated: true)
    }
}



