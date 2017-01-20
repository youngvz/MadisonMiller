//
//  ViewController.swift
//  MadisonMiller
//
//  Created by Viraj Shah on 1/20/17.
//  Copyright © 2017 Max Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    var homeController = HomeFeedViewController()
    
    let imagesArray = ["dress1", "dress2", "dress3"]
    let cellTitles = ["Velvet Long-Sleeve Dress", "Crewneck Tee w/ Long Sleeves", "Ashurst Classic Modern Jacket"]
    let cellDesigner = ["Peter Millar", "Ann Gish", "Marc Jacobs"]
    let cellPrice = ["$149.99", "$179.99", "$249.99"]

    let statusbar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.54, green:0.69, blue:0.32, alpha:1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let subtotalView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let itemsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Items: "
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .left

        return label
    }()
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "3"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    
    let subtotalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subtotal: "
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)

        return label
    }()
    
    let subtotal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "$579.97"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let shippingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shipping: "
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)

        return label
    }()
    
    let shippingStatus: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "In-Store"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .right
        
        return label
    }()
    
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total"
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$599.97"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .right
        
        return label
    }()
    
    lazy var checkOutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.54, green:0.69, blue:0.32, alpha:1.00)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
        return view
    }()
    
    let checkOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Continue"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(white: 0.9, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: cellId)

        collectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        setupViews()
        setupNavBar()
        setupStatusBar()
    }
    
    

    func setupViews(){
        view.addSubview(collectionView)
        view.addSubview(subtotalView)
        view.addSubview(checkOutView)
        checkOutView.addSubview(checkOutLabel)
        subtotalView.addSubview(itemsLabel)
        subtotalLabel.addSubview(itemLabel)
        subtotalView.addSubview(subtotalLabel)
        subtotalView.addSubview(subtotal)
        subtotalView.addSubview(shippingLabel)
        subtotalView.addSubview(shippingStatus)
        subtotalView.addSubview(totalLabel)
        subtotalView.addSubview(totalPriceLabel)
//
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        
        subtotalView.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        subtotalView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        subtotalView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        subtotalView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        itemsLabel.topAnchor.constraint(equalTo: subtotalView.topAnchor, constant: 20).isActive = true
        itemsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        itemsLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        itemsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        itemLabel.topAnchor.constraint(equalTo: itemsLabel.topAnchor).isActive = true
        itemLabel.leftAnchor.constraint(equalTo: itemsLabel.rightAnchor).isActive = true
        itemLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        itemLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        subtotalLabel.topAnchor.constraint(equalTo: itemsLabel.bottomAnchor, constant: 0).isActive = true
        subtotalLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        subtotalLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        subtotalLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        subtotal.topAnchor.constraint(equalTo: subtotalLabel.topAnchor).isActive = true
        subtotal.leftAnchor.constraint(equalTo: subtotalLabel.rightAnchor).isActive = true
        subtotal.widthAnchor.constraint(equalToConstant: 60).isActive = true
        subtotal.heightAnchor.constraint(equalToConstant: 20).isActive = true

        
        totalLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        totalLabel.centerYAnchor.constraint(equalTo: subtotalLabel.centerYAnchor).isActive = true
        totalLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        totalLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        shippingLabel.topAnchor.constraint(equalTo: subtotalLabel.bottomAnchor, constant: 0).isActive = true
        shippingLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        shippingLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        shippingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        

        shippingStatus.topAnchor.constraint(equalTo: subtotalLabel.bottomAnchor).isActive = true
        shippingStatus.leftAnchor.constraint(equalTo: shippingLabel.rightAnchor).isActive = true
        shippingStatus.widthAnchor.constraint(equalToConstant: 60).isActive = true
        shippingStatus.heightAnchor.constraint(equalToConstant: 20).isActive = true

        
        totalPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        totalPriceLabel.centerYAnchor.constraint(equalTo: shippingLabel.centerYAnchor).isActive = true
        totalPriceLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        totalPriceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        
        checkOutView.topAnchor.constraint(equalTo: subtotalView.bottomAnchor).isActive = true
        checkOutView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        checkOutView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        checkOutView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        checkOutLabel.centerXAnchor.constraint(equalTo: checkOutView.centerXAnchor).isActive = true
        checkOutLabel.centerYAnchor.constraint(equalTo: checkOutView.centerYAnchor).isActive = true
        checkOutLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        checkOutLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    func setupNavBar(){
        
        navigationItem.title = "My Cart"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red:0.54, green:0.69, blue:0.32, alpha:1.00)]
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.54, green:0.69, blue:0.32, alpha:1.00)

        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let deleteButton = UIBarButtonItem(image: UIImage(named: "Delete")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))

        navigationItem.leftBarButtonItem =  deleteButton

    }
    
    func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }

    
    func dismissView(){
        dismiss(animated: true, completion: nil)
        homeController.presentAlertVC("Purchase Confirmed", title: "Enjoy being an Fashion Icon!")
    }
    
    func setupStatusBar(){
        if let window = UIApplication.shared.keyWindow {
            
            window.addSubview(statusbar)
            
            statusbar.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
            statusbar.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
            statusbar.widthAnchor.constraint(equalTo: window.widthAnchor).isActive = true
            statusbar.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCell
        cell.designerLabel.text = cellDesigner[indexPath.item]
        cell.productImage.image = UIImage(named: imagesArray[indexPath.item])
        cell.priceLabel.text = cellPrice[indexPath.item]
        cell.designerLabel.text = cellDesigner[indexPath.item]
        
        cell.alpha = 0
        
        UIView.animate(withDuration: 1.4, animations: {
            cell.alpha = 1
        })
        
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 12, height: 80)
    }



}

