//
//  UserDetailsVC.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 15/03/2021.
//

import UIKit

class UserDetailsVC: UIViewController {
    
    var selectedUser:Int?
    
    var userPosts:[UserPosts] = []
    var userComments:[UserComments] = []
    
    var postPerUser:[UserPosts] = []
    var commentsPerPost:[UserComments] = []
    
   let tableView:UITableView = {
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
    
   
    var userDetailsImpl:UserDetailsImpl
    var userCommentImpl:UserCommentImpl
    
    init(userDetailsImpl:UserDetailsImpl,userCommentImpl:UserCommentImpl ) {
        self.userDetailsImpl = userDetailsImpl
        self.userCommentImpl = userCommentImpl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userDetailsImpl.networking(with: Constants.userPostApi)
        userCommentImpl.networking(with: Constants.userCommentsApi)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsImpl.delegate = self
        userCommentImpl.delegate = self
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
    
    func userPostSorted(i:Int) -> [UserPosts]{
        var output:[UserPosts] = []
        postPerUser.removeAll()
        for posts in userPosts {
            if posts.userId == i {
                output.append(posts)
            }
        }
        return output
    }
    
    func userCommentsSorted(i: Int) -> [UserComments]{
        
        var userCommentsSorted:[UserComments] = []
        
        for comment in userComments {
            if comment.postId == i {
                userCommentsSorted.append(comment)
            }
        }
        return userCommentsSorted
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

extension UserDetailsVC:UserPostDelegate{
    func updateUserPost(userData: [UserPosts]) {
        DispatchQueue.main.async {
            self.userPosts = userData
            self.postPerUser = self.userPostSorted(i: self.selectedUser!)
            self.tableView.reloadData()
        }
    }
}

extension UserDetailsVC:UserCommentsDelegate{
    func updateUserComments(userComments: [UserComments]) {
        DispatchQueue.main.async {
            self.userComments = userComments
            self.commentsPerPost = self.userCommentsSorted(i: self.selectedUser!)
            self.tableView.reloadData()
        }
    }
}

