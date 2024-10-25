//
//  HeaderViewCell.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 25.10.2024.
//

import UIKit

class HeaderViewCell: UICollectionViewCell {
    static var identifier: String = "HeaderViewCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .appBlack
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    weak var viewModel: HeaderViewCellProtocol?
    
    public func set(viewModel: HeaderViewCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.titleText
    }
}

// MARK: - UILayout
extension HeaderViewCell {
    private func addSubViews() {
        addTitle()
    }
    
    private func addTitle() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.bottom.equalToSuperview().inset(1)
        }
    }
}
