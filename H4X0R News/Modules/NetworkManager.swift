//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Saul Rivera on 05/04/20.
//  Copyright © 2020 Saul Rivera. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
}
