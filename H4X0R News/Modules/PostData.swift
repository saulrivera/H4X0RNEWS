//
//  PostData.swift
//  H4X0R News
//
//  Created by Saul Rivera on 05/04/20.
//  Copyright © 2020 Saul Rivera. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return self.objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String
}
