//
//  WebService.swift
//  MVP_Example
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

class WebService {
    
    func getPosts(callback: @escaping (Posts?) -> Void ) {
        /*
        var posts : Posts = []
        posts.append(Post(userID: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"))
        posts.append(Post(userID: 1, id: 2, title: "qui est esse", body: "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"))
         */
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Pasa por aquí: 0")
                callback(nil)
            } else {
                sleep(2)
                var dataArray : Posts?
                let decoder = JSONDecoder()
                guard let hasData = data else { return }
                dataArray = try! decoder.decode(Posts.self, from: hasData)
                callback(dataArray)
            }
        }.resume()
    }
    
    func getPost(authorID: String, callback: @escaping (Posts?) -> Void ) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(authorID)/posts") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Pasa por aquí: 0")
                callback(nil)
            } else {
                sleep(2)
                var dataArray : Posts?
                let decoder = JSONDecoder()
                guard let hasData = data else { return }
                do {
                    dataArray = try decoder.decode(Posts.self, from: hasData)
                } catch {
                    callback(nil)
                }
                callback(dataArray)
            }
        }.resume()
    }
    
}
