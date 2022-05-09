//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/01.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    static let identifier = "PostCollectionViewCell"
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupData()
    }

    public func setupData() {
        // 이미지뷰의 이미지를 업로드한다.
        
    }
}
