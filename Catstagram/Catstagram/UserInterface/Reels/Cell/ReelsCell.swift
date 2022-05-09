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
        
    }
    
    private func setupLayout() {
        guard let videoView = videoView else { return }
        contentView.addSubview(videoView)
        
        // snapkit으로 videoview, 아래 클로저의 make가 videoView가 된다.
        videoView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 셀의 컨텐트뷰에 맞춘다
        }

    }
    
}
