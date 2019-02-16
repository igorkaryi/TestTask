//
//  NewsCell.swift
//  SmartBoxTestTask
//
//  Created by Karigor on 2/15/19.
//  Copyright © 2019 IK. All rights reserved.
//

import SDWebImage
import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var shortDescriptionLabel: UILabel!

    weak var viewModel: NewsCellProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }

            titleLabel.text = viewModel.title
            shortDescriptionLabel.text = viewModel.shortDescription
            iconImage.sd_setImage(with: URL(string: viewModel.icon))
        }
    }
}
