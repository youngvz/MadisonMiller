//
//  ProductCell.swift
//  MadisonMiller
//
//  Created by Viraj Shah on 1/20/17.
//  Copyright © 2017 Max Media. All rights reserved.
//

import UIKit

class ProductCell: BaseCell {
    
    override func setupViews(){
        super.setupViews()

        backgroundColor = .white
        
        addSubview(productImage)
        addSubview(designerLabel)
        addSubview(productLabel)
        addSubview(quantityLabel)
        addSubview(heightOutline)
        addSubview(priceLabel)
        addSubview(bottomSeparatorView)
        
        productImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        productImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        productImage.widthAnchor.constraint(equalToConstant: 56).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        designerLabel.leftAnchor.constraint(equalTo: productImage.rightAnchor, constant: 6).isActive = true
        designerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        designerLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        designerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        productLabel.topAnchor.constraint(equalTo: designerLabel.bottomAnchor).isActive = true
        productLabel.leftAnchor.constraint(equalTo: designerLabel.leftAnchor).isActive = true
        productLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        productLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        quantityLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor).isActive = true
        quantityLabel.leftAnchor.constraint(equalTo: productLabel.leftAnchor).isActive = true
        quantityLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        quantityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        heightOutline.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        heightOutline.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        heightOutline.widthAnchor.constraint(equalToConstant: 0.3).isActive = true
        heightOutline.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        bottomSeparatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomSeparatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomSeparatorView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

        priceLabel.topAnchor.constraint(equalTo: designerLabel.topAnchor).isActive = true
        priceLabel.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor, constant: -6).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    let productImage : UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "dress1")
        iv.contentMode = .scaleAspectFit
       iv.translatesAutoresizingMaskIntoConstraints = false
       return iv
    }()
    
    let designerLabel: UILabel = {
        let label = UILabel()
        label.text = "Eileen Fisher"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let productLabel: UILabel = {
        let label = UILabel()
        label.text = "Velvet Long-Sleeve Duster Dress"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity: 1"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$149.99"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let bottomSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let heightOutline: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
