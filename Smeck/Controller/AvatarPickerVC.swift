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
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func segmentButtonPressed(_ sender: UISegmentedControl) {
        
    }
    
}
