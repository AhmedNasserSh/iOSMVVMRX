//
//  PostViewController.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/31/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class PostViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = PostViewModel()
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bindOperaion(operation: PostsApiWorker())
        self.bindViews()
        viewModel.getPosts(page: 1)
    }
    func bindViews () {
        tableView.accessibilityIdentifier = "tableview"
        viewModel.posts.bind(to: tableView.rx.items(cellIdentifier: "PostTableViewCell", cellType: PostTableViewCell.self)) { (row,post,cell) in
            cell.setName(name: post.name, row: row)
            cell.accessibilityIdentifier = "\(row)"
        }.disposed(by: bag)
    }


}
