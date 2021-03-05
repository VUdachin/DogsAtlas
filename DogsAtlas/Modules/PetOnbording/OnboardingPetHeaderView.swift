//
//  OnboardingPetFooterView.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 25.02.2021.
//

import UIKit

enum Stage {
    case category
    case data
    case photo
}

class OnboardingPetHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "OnboardingHeader"

    private lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .purple
        label.numberOfLines = 0
//        label.text = "Step 1 of 3"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        label.numberOfLines = 0
//        label.text = "Choose your pet"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - init
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupHeaderView()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(header: Stage) {
        switch header {
        case .category:
            stepLabel.text = "Step 1 of 3"
            questionLabel.text = "Choose your pet"
        case .data:
            stepLabel.text = "Step 2 of 3"
            questionLabel.text = "Tell us about your pet"
        case .photo:
            stepLabel.text = "Step 3 of 3"
            questionLabel.text = "Add your pet's photo"
        }
    }

    // MARK: - Setup UI
    private func setupSubviews() {
        addSubview(stepLabel)
        addSubview(questionLabel)
    }

    private func setupHeaderView() {
        setupSubviews()

        let safeArea = self.safeAreaLayoutGuide
        let inset: CGFloat = 12

        NSLayoutConstraint.activate([

            stepLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: inset),
            stepLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            stepLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset),

            questionLabel.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: inset),
            questionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: inset),
            questionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -inset)
        ])
    }

}
