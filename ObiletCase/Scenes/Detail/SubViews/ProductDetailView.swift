//
//  ProductDetailView.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 28.10.2024.
//

import UIKit

class ProductDetailView: UIView {
    
    //MARK: - Properties
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor.appBlack
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment  = .left
        label.textColor = .appGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var rateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var personStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var viewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 100
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    
    lazy var priceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dollar_icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var rateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star_circle")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user_icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor = UIColor.appBlack
        return label
    }()
    
    lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor = UIColor.appBlack
        return label
    }()
    
    lazy var personLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor = UIColor.appBlack
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
}

//MARK: - UILaayout
//MARK: - UILayout
extension ProductDetailView{
    private func addSubViews(){
        addScrollView()
        addDetailContentView()
        addImageView()
        addTitleLabel()
        addDescriptionLabel()
        addPriceStackView()
        addRateStackView()
        addPersonStackView()
        addViewStackView()
    }
    
    private func addScrollView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
       
    private func addDetailContentView() {
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    private func addImageView(){
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(250)
        }
    }
    
    private func addTitleLabel(){
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func addDescriptionLabel(){
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func addPriceStackView() {
        contentView.addSubview(priceStackView)
        priceStackView.addArrangedSubview(priceImageView)
        priceStackView.addArrangedSubview(priceLabel)
    }
    
    private func addRateStackView() {
        contentView.addSubview(rateStackView)
        rateStackView.addArrangedSubview(rateImageView)
        rateStackView.addArrangedSubview(rateLabel)
    }
    
    private func addPersonStackView() {
        contentView.addSubview(personStackView)
        personStackView.addArrangedSubview(personImageView)
        personStackView.addArrangedSubview(personLabel)
    }
    
    private func addViewStackView(){
        contentView.addSubview(viewStackView)
        viewStackView.addArrangedSubview(priceStackView)
        viewStackView.addArrangedSubview(rateStackView)
        viewStackView.addArrangedSubview(personStackView)
        viewStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}
