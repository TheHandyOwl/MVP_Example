//
//  PostsPresenter.swift
//  MVP_Example
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

protocol PostsViewDelegate : NSObjectProtocol {
    func displayPosts(posts : Posts)
    func displayPost(post : Post)
}

class PostsPresenter {

    private var postsService : PostsService?
    private var postsViewDelegate : PostsViewDelegate?
    
    init() {
        postsService = PostsService()
    }

}

// Delegate
extension PostsPresenter {
    func setPostsViewDelegate(postsViewDelegate delegate: UIViewController) {
        postsViewDelegate = delegate as? PostsViewDelegate
    }
}

// From / To ... view
extension PostsPresenter {
    
    func getPosts () {
        postsService?.getPosts(callback: { (posts) in
            if let posts = posts {
                self.postsViewDelegate?.displayPosts(posts: posts)
            } else {
                self.postsViewDelegate?.displayPosts(posts: [])
            }
        })
    }

    func postSelected (post: Post) {
        postsViewDelegate?.displayPost(post: post)
    }
    
}

