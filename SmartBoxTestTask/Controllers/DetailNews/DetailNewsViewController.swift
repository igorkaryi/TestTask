//
//  DetailNewsVC.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import RxSwift
import SDWebImage
import UIKit

class DetailNewsViewController: BaseViewController {
    @IBOutlet var bigIconImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var shortDescriptionLabel: UILabel!
    @IBOutlet var descLabel: UILabel!

    var disposeBag = DisposeBag()
    var viewModel: DetailNewsProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        guard let viewModel = viewModel else { return }
        bigIconImage?.sd_setImage(with: URL(string: viewModel.bigImage))
        titleLabel.text = viewModel.title
        shortDescriptionLabel.text = viewModel.shortDescription
        descLabel.text = viewModel.description
    }

    @IBAction func backAction(_: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func showOnMapAction(_: UIButton) {
        guard let vc = R.storyboard.main.mapViewController() else { return }
        guard let viewModel = viewModel?.showOnMap() else { return }
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}
