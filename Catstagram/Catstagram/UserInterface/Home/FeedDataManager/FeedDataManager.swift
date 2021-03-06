//
//  FeedDataManager.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/08.
//

import Alamofire

class FeedDataManager {
    // 데이터를 주고받는 함수
    func feedDataManager(_ parameters: FeedAPIInput, _ viewController: HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters ).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result) :
                viewController.successAPI(result)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
}
