//
//  ProfileCollectionViewCell.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/01.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountsLabel: UILabel!
    @IBOutlet weak var followerCountsLabel: UILabel!
    @IBOutlet weak var followingCountsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }
    
    private func setupAttribute() {
        profileImageView.layer.cornerRadius = 44
        addProfileImageView.layer.cornerRadius = 12
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.cornerRadius = 2
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        [postingCountsLabel, followerCountsLabel, followingCountsLabel].forEach {
            $0.text = "\(Int.random(in: 0...10))"
        }
    }

}
