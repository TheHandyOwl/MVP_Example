//
//  PostsViewController.swift
//  MVP_Example
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var postsPresenter : PostsPresenter!
    var posts : Posts = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPresenterViewDelegate()
        
        setupTableView()
        
        setupUI()
    }
    
}

extension PostsViewController {
    func setupUI() {
        title = "POSTS LIST"
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
}

extension PostsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        
        let model = posts[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if cell == nil {
            cell = UITableView().dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        }
        cell.textLabel?.text = "\(model.id?.description ?? "NA"). \(model.title ?? "No title")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postsPresenter.postSelected(view: self, post: posts[indexPath.row])
    }
    
}

extension PostsViewController : UITableViewDelegate {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension PostsViewController : PostsViewDelegate {
    
    func setupPresenterViewDelegate() {
        self.postsPresenter = PostsPresenter()
        self.postsPresenter.setPostsViewDelegate(postsViewDelegate: self)
        DispatchQueue.global().async {
            self.postsPresenter.getPosts()
        }
    }
    
    func displayPosts(posts: Posts) {
        self.posts = posts
        if posts.count != 0 {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        } else {
            Alert.okAlert(viewController: self, title: "Loading posts", body: "No posts availables")
        }
    }
    
}
