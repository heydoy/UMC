//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/09.
//

struct FeedUploadModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FeedUploadResult?
}

struct FeedUploadResult: Decodable {
    var postIdx: Int?
}
