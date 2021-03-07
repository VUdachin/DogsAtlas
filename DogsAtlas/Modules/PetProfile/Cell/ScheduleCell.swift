//
//  ScheduleCell.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 28.02.2021.
//

import UIKit

class ScheduleCell: UICollectionViewCell {

    static var reuseIdentifier = "SheduleCell"

    // MARK: - Create UI
    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var sheduleNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var sheduleTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Setup UI
    private func setupSubview() {
        contentView.addSubview(iconImage)
        contentView.addSubview(sheduleTimeLabel)
        contentView.addSubview(sheduleNameLabel)
    }

    private func setupCell() {
        setupSubview()
        
//        layer.masksToBounds = true
        layer.cornerRadius = 12
        //layer.borderWidth = 12
        layer.borderColor = CGColor(red: 85, green: 76, blue: 146, alpha: 1)
        
        
        let inset: CGFloat = 12

        NSLayoutConstraint.activate([

            iconImage.widthAnchor.constraint(equalToConstant: 50),
            iconImage.heightAnchor.constraint(equalToConstant: 50),
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),

            sheduleNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            sheduleNameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: inset),

            sheduleTimeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            sheduleTimeLabel.leadingAnchor.constraint(equalTo: sheduleNameLabel.trailingAnchor, constant: inset),
            sheduleTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            contentView.bottomAnchor.constraint(equalTo: sheduleTimeLabel.bottomAnchor, constant: inset)

        ])
    }

    // MARK: - Public Methods
    func configure(with pet: Pet) {
//        iconImage.image = UIImage(named: pet.image!)
//        sheduleNameLabel.text =
//        sheduleNameLabel.text =
    }

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        backgroundColor = .brown
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
