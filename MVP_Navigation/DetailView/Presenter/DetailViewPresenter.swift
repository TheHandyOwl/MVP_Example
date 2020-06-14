//
//  DetailViewPresenter.swift
//  MVP_Navigation
//
//  Created by Carlos on 14/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

protocol PostViewDelegate {
    func displayPost(post: Post, posts: [Post]?)
}

class DetailViewPresenter {
    
    var postViewDelegate : PostViewDelegate?
    var webService : WebService?
    
    var post : Post?
    
    init() {
        webService = WebService()
    }
    
    func setDelegate(postViewDelegate delegate : PostViewDelegate) {
        postViewDelegate = delegate
    }
    
    func getPost(post: Post) {
        if let authorID = post.userId?.description {
            self.postViewDelegate?.displayPost(post: post, posts: nil)
            
            self.post = post
            webService?.getPost(authorID: authorID, callback: { (posts) in
                if let posts = posts {
                    self.postViewDelegate?.displayPost(post: self.post!, posts: posts)
                } else {
                    self.postViewDelegate?.displayPost(post: self.post!, posts: [])
                }
            })
        }
    }
    
}
