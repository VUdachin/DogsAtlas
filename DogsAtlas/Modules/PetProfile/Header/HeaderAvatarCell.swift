//
//  HeaderAvatarCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 28.02.2021.
//

import UIKit

class HeaderAvatarCell: UICollectionViewCell {
    static var reuseIdentifier = "HeaderAvatarCell"

    // MARK: - Create UI
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    // MARK: - Setup UI
    private func setupSubview() {
        contentView.addSubview(avatarImageView)
    }

    private func setupCell() {
        setupSubview()

        NSLayoutConstraint.activate([

            avatarImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            avatarImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)

        ])
    }

    // MARK: - Public Methods
    func configure(with pet: Pet) {
//        avatarImageView.image = UIImage(data: pet.image ) // add default image
    }

    // MARK: - init
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupCell()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
