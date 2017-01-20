//
//  FeedCell.swift
//  MadisonMiller
//
//  Created by Viraj Shah on 1/20/17.
//  Copyright © 2017 Max Media. All rights reserved.
//

import UIKit

class FeedCell : BaseCell{
        
    
    let topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let profileImage: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "Asset 10")
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.3
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let designerLabel: UILabel = {
        let label = UILabel()
        label.text = "Adidas by StellaMcCartney"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productLabel: UILabel = {
        let label = UILabel()
        label.text = "Velvet Long-Sleeve Duster Dress"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let moreIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "more")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "photo1")
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let bottomContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$179.99"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .right
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
    
    let textDescription: UITextView = {
        let tv = UITextView()
        
        tv.text = "The best fashion forward dress this App has ever promoted. This shit is great Fam. Buy this shit right now mother fucker."
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.textColor = .gray
        tv.font = UIFont.systemFont(ofSize: 12)
        
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = false
        return tv
    }()

    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(imageView)
        addSubview(topContainer)
        
        
        addSubview(bottomContainer)
        addSubview(bottomSeparatorView)
        addSubview(heightOutline)
        
        imageView.topAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 175).isActive = true

        
        
        topContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topContainer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topContainer.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        topContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        topContainer.addSubview(profileImage)
        topContainer.addSubview(productLabel)
        topContainer.addSubview(designerLabel)
        topContainer.addSubview(moreIcon)
        
        profileImage.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        profileImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        productLabel.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 10).isActive = true
        productLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 10).isActive = true
        productLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        productLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        designerLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 4).isActive = true
        designerLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 10).isActive = true
        designerLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        designerLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        moreIcon.rightAnchor.constraint(equalTo: topContainer.rightAnchor, constant: -12).isActive = true
        moreIcon.centerYAnchor.constraint(equalTo: productLabel.centerYAnchor).isActive = true
        moreIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        moreIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bottomContainer.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        bottomContainer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomContainer.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bottomContainer.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        bottomContainer.addSubview(priceLabel)
        bottomContainer.addSubview(textDescription)
        
        priceLabel.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 6).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: bottomContainer.rightAnchor, constant: -12).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        textDescription.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 24).isActive = true
        textDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        textDescription.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -12).isActive = true
        textDescription.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        heightOutline.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        heightOutline.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        heightOutline.widthAnchor.constraint(equalToConstant: 0.3).isActive = true
        heightOutline.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        bottomSeparatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomSeparatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomSeparatorView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

        
    }
}
