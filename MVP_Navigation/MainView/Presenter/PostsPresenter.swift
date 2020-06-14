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
}

class PostsPresenter {

    private var webService : WebService?
    private var postsViewDelegate : PostsViewDelegate?
    
    init() {
        webService = WebService()
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
        webService?.getPosts(callback: { (posts) in
            if let posts = posts {
                self.postsViewDelegate?.displayPosts(posts: posts)
            } else {
                self.postsViewDelegate?.displayPosts(posts: [])
            }
        })
    }

    func postSelected (view: UIViewController, post: Post) {
        navToDetailViewController(view: view, post: post)
    }
    
}

// Routing
extension PostsPresenter {
    private func navToDetailViewController(view: UIViewController, post: Post) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.post = post
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

