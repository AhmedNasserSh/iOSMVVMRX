//
//  PostModel.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/30/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import Foundation
class PostResponse :BaseModel {
    public class PostModel :Equatable{
        var name : String?
        
        init(name :String) {
            self.name = name
        }
        public static func == (lhs: PostResponse.PostModel, rhs: PostResponse.PostModel) -> Bool {
            return lhs.name == rhs.name
        }
    }
    var posts :[PostModel]?
}

