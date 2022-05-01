//
//  FeedTableViewCell.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/01.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var countsOfLiksLabel: UILabel!
    @IBOutlet weak var feedLabel: UILabel!
    @IBOutlet weak var replyProfileImage: UIImageView!
    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    
    @IBAction func heartAction(_ sender: Any) {
        if heartButton.isSelected {
            heartButton.isSelected = false
        } else {
            heartButton.isSelected = true
        }
    }
    
    @IBAction func bookmarkAction(_ sender: Any) {
        if bookmarkButton.isSelected {
            bookmarkButton.isSelected = false
        } else {
            bookmarkButton.isSelected = true
        }
    }
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myProfileImage.layer.cornerRadius = myProfileImage.frame.width / 2.0
        myProfileImage.clipsToBounds = true
        
        replyProfileImage.layer.cornerRadius = replyProfileImage.frame.width / 2.0
        myProfileImage.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 10)
        let attributedString = NSMutableAttributedString(string: feedLabel.text ?? "" )
        attributedString.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 6))

        feedLabel.attributedText = attributedString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
