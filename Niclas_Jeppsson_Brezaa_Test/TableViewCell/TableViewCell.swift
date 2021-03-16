//
//  TableViewCell.swift
//  Niclas_Jeppsson_Brezaa_Test
//
//  Created by Niclas Jeppsson on 16/03/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var postLabel:UILabel = {
        let postLabel = UILabel()
        postLabel.font = UIFont.systemFont(ofSize: 12)
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLabel
    }()
    
    var comments:UILabel = {
        let comments = UILabel()
        comments.font = UIFont.systemFont(ofSize: 12)
        comments.translatesAutoresizingMaskIntoConstraints = false
        return comments
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setConstraints(){
        addSubview(postLabel)
        addSubview(comments)
        
        NSLayoutConstraint.activate([postLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10), postLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10), postLabel.widthAnchor.constraint(equalToConstant: 200), comments.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10), comments.topAnchor.constraint(equalTo: topAnchor, constant: 10), comments.widthAnchor.constraint(equalToConstant: 100)])
    }
    
}
