//
//  StoryCollectionViewCell.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/01.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewBackgroundView: UIView!
    @IBOutlet weak var userProfileBackgroundView: UIView!
    @IBOutlet weak var userProfileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewBackgroundView.layer.cornerRadius = 24
        userProfileBackgroundView.layer.cornerRadius = 23.5
        userProfileImage.layer.cornerRadius = 22
        userProfileImage.clipsToBounds = true
    }

}
