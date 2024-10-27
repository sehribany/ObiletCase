//
//  ProductCell.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 25.10.2024.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static var identifier: String = "ProductCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private var productStackView : UIStackView = {
        let stackView     = UIStackView()
        stackView.axis    = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .appBlack
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .appGray
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
 
    weak var viewModel: ProductCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

//MARK: - UILayout
extension ProductCell{
    private func addSubViews(){
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.appGray.cgColor
       
        addImageView()
        addProductsStackView()
    }
    
    private func addImageView(){
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    private func addProductsStackView(){
        addSubview(productStackView)
        productStackView.addArrangedSubview(titleLabel)
        productStackView.addArrangedSubview(priceLabel)
        productStackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
}

// MARK: - Configure and Set Localize
extension ProductCell{
    public func set(viewModel: ProductCellProtocol) {
        self.viewModel = viewModel
        let product = viewModel.product
        imageView.setImage(product.image)
        titleLabel.text = product.title
        priceLabel.text = String(product.price)
    }
}
