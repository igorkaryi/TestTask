//
//  NewsVC.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import RxSwift
import UIKit

class NewsViewController: BaseViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var chooseTypeControll: UISegmentedControl!
    private let refreshControl = UIRefreshControl()

    var disposeBag = DisposeBag()
    private var viewModel: NewsProtocols?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        getNews()
        configRefreshControl()
    }

    private func setup() {
        viewModel = NewsViewModel()
        showLoad()
        viewModel?.filteredNewsArray
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
                self?.hideLoad()
            }).disposed(by: disposeBag)

        viewModel?.errorString
            .asObservable()
            .subscribe(onNext: { [weak self] errorStr in
                self?.hideLoad()
                if errorStr != "" {
                    self?.presentAlertWithTitle(title: "", message: errorStr, buttons: "Ok", completion: { _ in })
                }
            }).disposed(by: disposeBag)
    }

    private func configRefreshControl() {
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(getNews), for: .valueChanged)
    }

    @objc private func getNews() {
        viewModel?.getNews()
    }

    @IBAction func chooseType(_: UISegmentedControl) {
        switch chooseTypeControll.selectedSegmentIndex {
        case 0:
            viewModel?.getFilteredNews(type: .event)
        case 1:
            viewModel?.getFilteredNews(type: .shop)
        default:
            break
        }
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.newsCell, for: indexPath)

        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }

        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = R.storyboard.main.detailNewsViewController() else { return }
        guard let viewModel = viewModel?.detailViewModel(forIndexPath: indexPath) else { return }
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}
