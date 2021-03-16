//
//  UserDetailsVC.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

class UserDetailsVC: UIViewController {
    
    var postPerUser:[UserPosts] = []
    var commentsPerPost:[UserComments] = []
    
    private let tableView:UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private let userIcon:UIImageView = {
        let userIcon = UIImageView()
        userIcon.imageFrom(url: URL(string: Constants.userIconApi)!)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
        
        view.addSubview(tableView)
        view.addSubview(userIcon)
        view.addSubview(userInfo)
        userInfo.addArrangedSubview(nameLabel)
        userInfo.addArrangedSubview(emailLabel)
        userInfo.addArrangedSubview(addressLabel)
        
        NSLayoutConstraint.activate([userIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), userIcon.heightAnchor.constraint(equalToConstant: 75), userIcon.widthAnchor.constraint(equalToConstant: 75), userIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor), userInfo.topAnchor.constraint(equalTo: userIcon.bottomAnchor), userInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor), userInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor), userInfo.heightAnchor.constraint(equalToConstant: 100), tableView.topAnchor.constraint(equalTo: userInfo.bottomAnchor), tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor), tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor), tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension UserDetailsVC:UITableViewDelegate {
    
}

extension UserDetailsVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postPerUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! TableViewCell
        cell.postLabel.text = postPerUser[indexPath.row].title
        cell.comments.text = "Comments: \(commentsPerPost.count)"
        return cell
    }
    
    
}


