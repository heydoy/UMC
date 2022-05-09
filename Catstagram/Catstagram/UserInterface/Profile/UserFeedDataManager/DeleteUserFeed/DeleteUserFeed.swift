//
//  DeleteUserFeed.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/05/09.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
    
}
