//
//  HomeFeedViewController.swift
//  MadisonMiller
//
//  Created by Viraj Shah on 1/20/17.
//  Copyright © 2017 Max Media. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    let imagesArray = ["photo1", "photo2", "photo3", "photo4"]
    let cellTitles = ["Long Silk Jersey Tunic", "Crewneck Tee w/ Long Sleeves", "Ashurst Classic Modern Jacket", "Two-Tone Capelet Shift Dress"]
    let cellDesigner = ["Peter Millar", "Ann Gish", "Marc Jacobs", "Chanel"]
    let cellPrice = ["$199.99", "$279.99", "$349.99", "$125.99"]
    let cellDescription = ["Feel absolutely beautiful in this one of a kind, Peter Millar Long Silk Tunic. Get it today. What are you waiting for you?" , "Simple and sleek. A girl can never go wrong with an all black look. Make this Ann Gish look yours.", "Modern meets Classic. This jacket will guarentee you are the most fashion forward business executive in the room.", "This absolutely ravishing dress is available exclusively through Madison Miller. This Chanel exclusive is a must!"]
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        setupNavBar()
        setupViews()
        setupStatusBar()
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)

    }
    
    
    
    let welcomeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome, Katie!"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
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

    let statusbar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.44, green:0.51, blue:0.39, alpha:1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    func setupStatusBar(){
        if let window = UIApplication.shared.keyWindow {
            
            window.addSubview(statusbar)
            
            statusbar.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
            statusbar.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
            statusbar.widthAnchor.constraint(equalTo: window.widthAnchor).isActive = true
            statusbar.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
        }
        
    }
    
    func setupViews(){
        view.addSubview(welcomeView)
        welcomeView.addSubview(welcomeLabel)
        view.addSubview(bottomSeparatorView)
        view.addSubview(heightOutline)
        view.addSubview(collectionView)
        
        
        welcomeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        welcomeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 4).isActive = true
        welcomeView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -8).isActive = true
        welcomeView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        welcomeLabel.centerXAnchor.constraint(equalTo: welcomeView.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: welcomeView.centerYAnchor).isActive = true
        welcomeLabel.widthAnchor.constraint(equalTo: welcomeView.widthAnchor, multiplier: 2/3).isActive = true
        welcomeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        bottomSeparatorView.bottomAnchor.constraint(equalTo: welcomeView.bottomAnchor).isActive = true
        bottomSeparatorView.leftAnchor.constraint(equalTo: welcomeView.leftAnchor).isActive = true
        bottomSeparatorView.widthAnchor.constraint(equalTo: welcomeView.widthAnchor).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
        heightOutline.topAnchor.constraint(equalTo: welcomeView.topAnchor).isActive = true
        heightOutline.rightAnchor.constraint(equalTo: welcomeView.rightAnchor).isActive = true
        heightOutline.widthAnchor.constraint(equalToConstant: 0.3).isActive = true
        heightOutline.heightAnchor.constraint(equalTo: welcomeView.heightAnchor).isActive = true
        
        
        collectionView.topAnchor.constraint(equalTo: heightOutline.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    func setupNavBar(){
        navigationItem.title = "Madison Miller"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        //self.navigationController?.navigationBar.tintColor = UIColor(red:0.54, green:0.69, blue:0.32, alpha:1.00)
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.54, green:0.69, blue:0.32, alpha:1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let cartButton = UIBarButtonItem(image: UIImage(named: "Cart")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(checkout))
        cartButton.tintColor = .white
        navigationItem.rightBarButtonItem =  cartButton
        
    }
    
    func checkout(){
        var vc = ViewController()
        vc.homeController = self

        let navController = UINavigationController(rootViewController: vc)
        
        present(navController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.item
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        cell.productLabel.text = cellTitles[index]
        cell.designerLabel.text = cellDesigner[index]
        cell.imageView.image = UIImage(named: imagesArray[index])
        cell.priceLabel.text = cellPrice[index]
        cell.textDescription.text = cellDescription[index]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (view.frame.width - 8), height: 300)
    }

    
    func presentAlertVC(_ message: String, title: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
        }
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true)
        
        
    }



}
