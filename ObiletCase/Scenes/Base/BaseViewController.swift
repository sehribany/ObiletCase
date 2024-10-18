//
//  BaseViewController.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 13.10.2024.
//

import UIKit
import Kingfisher
import SnapKit

class BaseViewController<V: BaseViewProtocol>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToast()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subscribeToast() {
        viewModel.showWarningToast = { text in
            ToastPresenter.showWarningToast(text: text)
        }
    }
    
    func showWarningToast(message: String) {
        ToastPresenter.showWarningToast(text: message)
    }
}

extension BaseViewController {
    func addNavigationBarLogo() {
        let image                = UIImage(named: "user")
        let imageView            = UIImageView()
        imageView.contentMode    = .scaleAspectFit
        imageView.image          = image
        navigationItem.titleView = imageView
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(50)
        }
        
        let barButtonItem = UIBarButtonItem(customView: imageView)
        navigationItem.rightBarButtonItem = barButtonItem
    }
}
