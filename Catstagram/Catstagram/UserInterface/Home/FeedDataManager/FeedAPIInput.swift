//
//  FeedAPIInput.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/08.
//

struct FeedAPIInput : Encodable {
    var limit: Int?
    var page: Int?
}
