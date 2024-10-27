//
//  HeaderView.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 25.10.2024.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static var identifier: String = "HeaderView"
    
    lazy var nestedCollectionView: UICollectionView = {
        let layout                     = UICollectionViewFlowLayout()
        layout.scrollDirection         = .horizontal
        let collectionView             = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .appWhite
        collectionView.register(HeaderViewCell.self, forCellWithReuseIdentifier: HeaderViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    var viewmodel : HeaderViewProtocol
    var delegate  : HeaderViewEventSource?
    
    override init(frame: CGRect) {
        self.viewmodel = HeaderViewModel()
        super.init(frame: frame)
        addSubViews()
    }
    
    init(frame: CGRect, viewModel: HeaderViewProtocol) {
        self.viewmodel = viewModel
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewmodel = HeaderViewModel()
        super.init(coder: aDecoder)
        addSubViews()
    }
}

// MARK: - UILayout
extension HeaderView{
    
    private func addSubViews(){
        addCollectionView()
    }
    
    private func addCollectionView(){
        addSubview(nestedCollectionView)
        nestedCollectionView.dataSource = self
        nestedCollectionView.delegate   = self
        nestedCollectionView.frame      = CGRect(x: 9.0, y: bounds.origin.y, width: bounds.width - 9.0, height: bounds.height)
    }
}

// MARK: - UICollectionViewDelegate and UICollectionViewDataSource
extension HeaderView : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.numberOfItemsAt(section: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell                = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderViewCell.identifier, for: indexPath) as! HeaderViewCell
        cell.backgroundColor    = .appBackground
        cell.layer.borderWidth  = 0.4
        cell.layer.borderColor  = UIColor.appBlack.cgColor
        cell.layer.cornerRadius = 10
        let cellItem            = viewmodel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellItem  = viewmodel.cellItemAt(indexPath: indexPath)
        let titleText = cellItem.titleText
        let label     = HeaderViewCell().titleLabel
        label.text    = titleText
        let textWidth = label.contentWidth()
        let cellWidth = textWidth + 20
        let cellHeight: CGFloat = 30
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate!.didSelectHeaderItem(at: indexPath)
    }
}
