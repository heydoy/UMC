//
//  ReelsViewController.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/09.
//

import UIKit
import SnapKit

class ReelsViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var currentPage = 0 // 현재 무슨 페이지에 있는지 체크하는 변수
    
    
    private let videoURLStrArr = ["dummyVideo", "dummyVideo02", "dummyVideo03"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

    }
    
    // MARK: - Action
    
    
    // MARK: - Helpers
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast // 스크롤이 빨리 되도록 처리
        // 코드로 셀을 만들경우 Nib이 아니라 아래처럼
        collectionView.register(
            ReelsCell.self,
            forCellWithReuseIdentifier: ReelsCell.identifier)
        
        // 컬렉션뷰가 셋업이 다 된 후에 릴스가 반복되는 메소드를 호출
        startLoop()
        
    }
    
    // 일정시간마다 릴스가 넘어갔으면 좋겠으므로 메소드를 만들기, Timer 객체를 이용
    private func startLoop() {
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.moveNextPage()
        }
    }
    
    // 다음페이지로 넘기는 메소드
    private func moveNextPage() {
        // 아이템의 갯수를 확인, 섹션이 하나므로 0
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        currentPage += 1
        
        if (currentPage >= itemCount) {
            //마지막 페이지이므로
            currentPage = 0
        }
        // 처음 페이지로 돌아가게, 수직으로 이동(centered vertically)
        collectionView.scrollToItem(
            at:IndexPath( item: currentPage,section: 0),
            at: .centeredVertically,
            animated: true)
    }
}

// MARK: - CollectionView Datasource, Delegate

extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ReelsCell.identifier,
            for: indexPath) as? ReelsCell else { return UICollectionViewCell() }
        
        cell.setupURL(videoURLStrArr.randomElement()!)
        
        return cell
    }
    
    // 메모리관리
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            cell.videoView?.cleanup()
        }
    }
    
    
    
}

extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(1)
    }
}
