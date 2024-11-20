//
//  CustomSearchBar.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 19.10.2024.
//

import UIKit
import SnapKit

class CustomSearchBar: UIView, UITextFieldDelegate {
    
    //MARK: -Properties
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .appBackground
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Find your favorite product"
        textField.textColor = .black
        textField.tintColor = .appBlack
        return textField
    }()
    
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .appBlack
        return imageView
    }()
    
    var onTextChange: StringClosure?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        textField.delegate = self
    }

    func getSearchText() -> String? {
        return textField.text
    }
    
    func clearSearchText() {
        textField.text = ""
    }
    
    // UITextFieldDelegate Method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text ?? "") as NSString
        let updatedText = currentText.replacingCharacters(in: range, with: string)
        onTextChange?(updatedText)
        return true
    }
}

//MARK: -UILayout
extension CustomSearchBar{
    private func addSubViews(){
        addSubview(containerView)
        containerView.addSubview(searchIcon)
        containerView.addSubview(textField)
    }
    
    private func setupView(){
        addSubViews()
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        searchIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(searchIcon.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.height.equalTo(44)
        }
    }
}
