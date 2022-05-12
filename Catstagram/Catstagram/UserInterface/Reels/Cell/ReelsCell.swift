//
//  ReelsCell.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/09.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell: UICollectionViewCell {
    static let identifier = "ReelsCell"
    
    var videoView: VideoPlayerView?
    
    // 릴스라는 이름을 입력받을 것
    let cellTitleLabel = UILabel()
    
    // 카메라 모양
    let cameraImageView = UIImageView()
    
    // 댓글
    let commentImageView = UIImageView()
    
    // 좋아요
    let likeImageView = UIImageView()
    
    // 공유 (기능을 추가할거라면 버튼으로 변경)
    let shareImageView = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupURL(_ urlStr: String) {
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        
        setupAttribute()
        setupLayout()
    }
    
    private func setupAttribute() {
        cellTitleLabel.text = "릴스"
        cellTitleLabel.font = .boldSystemFont(ofSize: 25)
        cellTitleLabel.textAlignment = .left
        cellTitleLabel.textColor = .white
        
        [cameraImageView, shareImageView, likeImageView, commentImageView]
            .forEach {
                $0.contentMode = .scaleAspectFit
                $0.tintColor = .white
            }
        
        
        cameraImageView.image = UIImage(systemName: "camera")
        
        shareImageView.image = UIImage(systemName: "paperplane")
        
        likeImageView.image = UIImage(systemName: "heart")
        
        commentImageView.image = UIImage(systemName: "message")
        



    }
    
    private func setupLayout() {
        guard let videoView = videoView else { return }
        contentView.addSubview(videoView)
        
        // snapkit으로 videoview, 아래 클로저의 make가 videoView가 된다.
        videoView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 셀의 컨텐트뷰에 맞춘다
        }
        [ cellTitleLabel, cameraImageView,
        likeImageView,
        commentImageView,
        shareImageView]
            .forEach { contentView.addSubview($0) }
        
        cellTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)

        }
        
        
        let space = CGFloat(-20)
        
        shareImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.equalToSuperview().offset(-20)
            
            make.width.height.equalTo(35)
        }
        
        commentImageView.snp.makeConstraints { make in
            make.bottom.equalTo(shareImageView.snp.top).offset(space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
        
        likeImageView.snp.makeConstraints { make in
            make.bottom.equalTo(commentImageView.snp.top).offset(space)
            make.centerX.equalTo(commentImageView)
            make.width.height.equalTo(35)
        }
    }
    
}
