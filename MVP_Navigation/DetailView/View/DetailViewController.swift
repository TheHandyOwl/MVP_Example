//
//  DetailViewController.swift
//  MVP_Navigation
//
//  Created by Carlos on 14/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var otherPostsLabel: UILabel!
    
    var post : Post!
    var presenter : DetailViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPresenterViewDelegate()
        setupUI()
    }
    
}

extension DetailViewController {
    func setupUI() {
        title = "Post detail and more".uppercased()
    }
}

extension DetailViewController : PostViewDelegate {
    
    func setupPresenterViewDelegate() {
        presenter = DetailViewPresenter()
        presenter?.setDelegate(postViewDelegate: self)
        DispatchQueue.global().async {
            self.presenter?.getPost(post: self.post)
        }
    }
    
    func displayPost(post: Post, posts: [Post]?) {
        DispatchQueue.main.async {
            if let title = post.title, let body = post.body {
                self.titleLabel.text = title
                self.bodyLabel.text = "\(body)"
            }
            if let posts = posts {
                if posts.count > 0 {
                    self.otherPostsLabel.text = "Other posts:"
                    for item in posts {
                        if let otherPosts = self.otherPostsLabel.text, let title = item.title {
                            self.otherPostsLabel.text = """
                            \(otherPosts)
                            - \(title)
                            """
                        }
                    }
                } else {
                    self.otherPostsLabel.text = "No more posts from the same author."
                }
            } else {
                self.otherPostsLabel.text = "Loading other posts from the same author ..."
            }
        }
    }
    
}
