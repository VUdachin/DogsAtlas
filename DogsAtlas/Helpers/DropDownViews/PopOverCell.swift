//
//  DropDownCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 25.02.2021.
//

import UIKit

class PopOverCell: UITableViewCell {

    static let reuseIdentifier = "DropDownCell"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with array: String) {
        titleLabel.text = array
    }

    // MARK: - Setup UI
    private func setupSubview() {
        contentView.addSubview(titleLabel)
    }

    private func setupCell() {
        setupSubview()

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
}
