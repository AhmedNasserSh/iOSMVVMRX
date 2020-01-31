//
//  PostModel.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
struct PostResponse :Codable  {
     struct PostModel :Codable,Equatable{
        var name : String
        
        public static func == (lhs: PostResponse.PostModel, rhs: PostResponse.PostModel) -> Bool {
            return lhs.name == rhs.name
        }
    }
    var posts :[PostModel]
}

