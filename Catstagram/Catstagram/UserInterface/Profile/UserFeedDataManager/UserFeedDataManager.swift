//
//  UserFeedDataManager.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/09.
//

import Alamofire

class UserFeedDataManager {
    
    // MARK: - 유저피드조회 API
    func getUserFeed(_ viewController: ProfileViewController,
                     _ userId: Int = 2 ) {
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userId)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: UserFeedModel.self) { response in
                
                switch response.result {
                case .success(let result):
                    viewController.successFeedAPI(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    // MARK: - 게시물삭제 API
    func deleteUserFeed(_ viewController: ProfileViewController,
                     _ postIdx: Int ) {
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
                   method: .patch,
                   parameters: nil)
            .validate()
            .responseDecodable(of: DeleteUserFeed.self) { response in
                
                switch response.result {
                case .success(let result):
                    viewController.successDeletePostAPI(result.isSuccess ?? false)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
