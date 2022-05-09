//
//  ProfileViewController.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/01.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts: [GetUserPosts]? {
        didSet { self.profileCollectionView.reloadData() }
    }
    
    var deletedIndex: Int?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        setupData()
        
    }
    
    // MARK: - Actions
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer) {
        // 제스쳐가 시작한 상태가 아니면 종료. 버그를 막기 위한 방어코드
        if gestureRecognizer.state != .began { return }
        
        // 롱프레스한 셀이 어떤 셀인지 위치를 통해서 그 셀에 접근할 수 있다.
        let position = gestureRecognizer.location(in: profileCollectionView)
        
        if let indexPath = profileCollectionView?.indexPathForItem(at: position) {
            print("DEBUG: ", indexPath.item)
            
            // 삭제 API를 호출

            guard let userPosts = self.userPosts else { return }
            let cellData = userPosts[indexPath.item]
            
            self.deletedIndex = indexPath.item
            
            if let postIdx = cellData.postIdx {
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
        }
    }
    
    
    
    // MARK: - Helpers
    private func setupCollectionView() {
        
        // Delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        // 셀 등록
        // 프로필 셀 등록
        profileCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        // 포스트 셀 등록
        profileCollectionView.register(
            UINib(nibName: "PostCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        // 제스쳐 추가
        let gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(didLongPressCell(gestureRecognizer:)))
        
        
        gesture.minimumPressDuration = 0.7
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        profileCollectionView.addGestureRecognizer(gesture)
    }
    
    private func setupData() {
        UserFeedDataManager().getUserFeed(self)

    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // 섹션의 갯수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    // 셀의 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return userPosts?.count ?? 0
        }
    }
    
    // 셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section {
        case 0: //Profile
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
                fatalError("Cell Type Casting Failed..")
            }
            return cell
            
        default: //Post
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
                fatalError("Cell Type Casting Failed..")
            }
            let itemIndex = indexPath.item
            if let cellData = self.userPosts {
                // 데이터가 있는 경우 cell에 데이터를 전달
                cell.setupData(cellData[itemIndex].postImgUrl) // 데이터전달

            }
            
            return cell
        }
    }
}

// 셀 크기
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let section = indexPath.section
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(159))
        default:
            let margin = CGFloat(1)
            let side = CGFloat((collectionView.frame.width/3) - (margin * 2))
            return CGSize(width: side, height: side)
            
        }
    }
    
    // 아이템 열간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
    // 아이템 행간
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}

// MARK: - API 통신 메소드

extension ProfileViewController {
    
    func successFeedAPI(_ result: UserFeedModel) {
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool) {
        
        guard isSuccess else { return }
        
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
