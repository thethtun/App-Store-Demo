//
//  ViewController.swift
//  TdF
//
//  Created by Thet Htun on 8/23/19.
//  Copyright © 2019 blahblahblah. All rights reserved.
//

import UIKit
import SDWebImageWebPCoder

class ViewController: UIViewController {
    
    var data : [AppInfo]?
    var appCategory : [AppCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
        //Image Loader
        let WebPCoder = SDImageWebPCoder.shared
        SDImageCodersManager.shared.addCoder(WebPCoder)
        
        //Load Offline Json
        data = JsonUtils.loadJson(filename: "data")
        appCategory = JsonUtils.loadJson(filename: "AppCategories")
    }
    
    private func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(UINib(nibName: BigBannerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BigBannerCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: SmallAppBannerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SmallAppBannerCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: AppVideoCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AppVideoCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: BigAppBannerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BigAppBannerCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: TitleSupplementaryView.reuseIdentifier)
        
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
    
    private func generateLayout() -> UICollectionViewCompositionalLayout {
        
        /*
         item
         
         item size
         
         group - item
         
         group size
         
         section - group
         
         */
        
        
        let layout = UICollectionViewCompositionalLayout{ (sectionIndex: Int,
                                                           layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .fractionalHeight(0.45))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
                
            } else if sectionIndex == 1 {

                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                let threeRowGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
                
                let mainGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(220))
                
                let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: mainGroupSize, subitems: [threeRowGroup])
                
                let section = NSCollectionLayoutSection(group: mainGroup)
                
                section.orthogonalScrollingBehavior = .groupPaging
                
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: "header", alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
                
            } else if sectionIndex == 2 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                
                let mainGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.45))
                
                let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: mainGroupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: mainGroup)
                
                section.orthogonalScrollingBehavior = .groupPaging
                
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: "header", alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
            } else if sectionIndex == 3 || sectionIndex == 4 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                               
               let item = NSCollectionLayoutItem(layoutSize: itemSize)
               item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
               
               let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
               
               let twoRowGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
               
                let mainGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(300))
               
               let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: mainGroupSize, subitems: [twoRowGroup])
               
               let section = NSCollectionLayoutSection(group: mainGroup)
               
               section.orthogonalScrollingBehavior = .groupPaging
                
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: "header", alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
               return section
            } else if sectionIndex == 5 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(40))
                                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                 
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: "header", alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
            } else {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.33))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                let threeRowGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
                
                let mainGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.4))
                
                let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: mainGroupSize, subitems: [threeRowGroup])
                
                let section = NSCollectionLayoutSection(group: mainGroup)
                
                section.orthogonalScrollingBehavior = .groupPaging
                
                let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: "header", alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader]
                
                return section
            }

        }
        
        return layout
        
    }
    
 
}

extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 5 {
            return appCategory!.count
        }
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = data else {
            return UICollectionViewCell()
        }
        let totalItem = data.count - 1
        let appInfo = data[Int.random(in: 0...totalItem)]
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigBannerCollectionViewCell.identifier, for: indexPath) as! BigBannerCollectionViewCell
            cell.label.text = appInfo.app_name
            cell.imageView.sd_setImage(with: URL(string: appInfo.image_url), completed: nil)
            cell.imageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.5...1))
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallAppBannerCollectionViewCell.identifier, for: indexPath) as! SmallAppBannerCollectionViewCell
            cell.label.text = appInfo.app_name
            cell.imageView.sd_setImage(with: URL(string: appInfo.image_url)){ _,_,_,_ in

            }
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppVideoCollectionViewCell.identifier, for: indexPath) as! AppVideoCollectionViewCell
            cell.label.text = appInfo.app_name
            cell.imageView.sd_setImage(with: URL(string: appInfo.image_url), completed: nil)
            cell.imageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
            cell.imageViewSmall.sd_setImage(with: URL(string: appInfo.image_url), completed: nil)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigAppBannerCollectionViewCell.identifier, for: indexPath) as! BigAppBannerCollectionViewCell
            cell.label.text = appInfo.app_name
            cell.imageView.sd_setImage(with: URL(string: appInfo.image_url), completed: nil)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigAppBannerCollectionViewCell.identifier, for: indexPath) as! BigAppBannerCollectionViewCell
            cell.label.text = appInfo.app_name
            cell.imageView.sd_setImage(with: URL(string: appInfo.image_url), completed: nil)
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            let itemData = appCategory![indexPath.row]
            cell.label.text = itemData.name
            cell.imageView.image = UIImage(named: itemData.category_icon)
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallAppBannerCollectionViewCell.identifier, for: indexPath) as! SmallAppBannerCollectionViewCell
            return cell
        }
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: TitleSupplementaryView.reuseIdentifier, for: indexPath) as! TitleSupplementaryView
        switch indexPath.section {
        case 0:
            cell.label.text = "Big banner"
        case 1:
            cell.label.text = "Popular Games"
        case 2:
            cell.label.text = "What We Are Playing Today?"
        case 3:
            cell.label.text = "Coming Soon"
        case 4:
            cell.label.text = "More Games You Might Like"
        case 5:
            cell.label.text = "App Categories"
        default:
            cell.label.text = "Section Headers"
        }
        return cell
    }
    
    
}


