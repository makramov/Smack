//
//  AvatarPickerVC.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/20/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    //outlets here
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentCL: UISegmentedControl!
    
    var avatarType = AvatarColor.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //Collection View methods here
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? AvatarCell {
            
            cell.pickUpAvatarImage(index: indexPath.item, type: avatarType)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if avatarType == .dark {
            UserDataService.instanse.setAvatarName(avatarName: "dark\(indexPath.item)")
        } else {
            UserDataService.instanse.setAvatarName(avatarName: "light\(indexPath.item)")
        }
       self.dismiss(animated: true, completion: nil)
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        
        
        var numOfColumns: CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numOfColumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
         return CGSize(width: cellDimension, height: cellDimension)
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func segmentButtonPressed(_ sender: UISegmentedControl) {
        
        if segmentCL.selectedSegmentIndex == 0  {
            avatarType = .dark
            
        } else if segmentCL.selectedSegmentIndex ==  1{
            avatarType = .light
        }
        
        collectionView.reloadData()
        
    }
    
}
