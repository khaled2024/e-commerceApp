//
//  OnboardingViewController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 21/02/2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    private let slides: [Slide] = collectionSlides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        // page controll
        pageControl.numberOfPages = slides.count
        pageControl.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
    }
    // functions
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(collectionView.contentOffset.y/scrollView.frame.size.height)
        pageControl.currentPage = index
    }
    func handelButtonTapped(indexPath: IndexPath){
        if indexPath.item == slides.count - 1{
            showMainApp()
        }else{
            let nextItem = indexPath.item + 1
            let nextIndexPath = IndexPath(item: nextItem, section: 0)
            collectionView.scrollToItem(at: nextIndexPath, at: .top, animated: true)
            pageControl.currentPage = nextItem
        }
    }
    func showMainApp(){
        let mainVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "MainTabBarController")as! MainTabBarController
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
    }
}
// Extension :-
extension OnboardingViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)as! OnboardingCollectionViewCell
        let slide = slides[indexPath.row]
        cell.config(with: slide)
        cell.buttonTapped = { [weak self] in
            self?.handelButtonTapped(indexPath: indexPath)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
