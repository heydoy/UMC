//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/01.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {

    static let identifier = "PostCollectionViewCell"
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupData(_ imageUrlString: String?) {
        // 이미지뷰의 이미지를 업로드한다.
        
        guard let imageUrlString = imageUrlString else { return }
        if let url = URL(string: imageUrlString) {
            postImageView.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo"))
        }

    }
}
