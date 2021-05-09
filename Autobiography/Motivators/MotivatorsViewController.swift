//
//  MotivatorsViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import UIKit

class MotivatorsViewController: UIViewController {
    private var motivatorsCollectionView: UICollectionView!
    
    private let router = Router()
    
    private var motivators = [Motivator]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        self.setupView()
    }
    
    func initialize() {
        self.motivators.append(Motivator(name: "Стив Джобс",
                                         imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Steve_Jobs_Headshot_2010-CROP.jpg/274px-Steve_Jobs_Headshot_2010-CROP.jpg"))
        self.motivators.append(Motivator(name: "Марк Цукерберг", imageUrl: "https://lh3.googleusercontent.com/proxy/ZAvUQuJt82kI5g9AWedyBpyM5_XIkiXvupTS42zXGhWrRLgvIamTrdGcLuTo8B7fOM6DPqk1kPDGglT_cmeYWZ-B-CuOJbYzPX7wpBA"))
        self.motivators.append(Motivator(name: "Джефф Безос",
                                         imageUrl: "https://tech.24tv.ua/resources/photos/news/201808/1018181.jpg?1609253086000"))
        self.motivators.append(Motivator(name: "Павел Дуров",
                                         imageUrl: "https://ichef.bbci.co.uk/news/640/cpsprodpb/15F4F/production/_112953998_17569d45-47c1-48f4-bfad-ccf75b813f8e.jpg"))
    }
}

extension MotivatorsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewWidth = self.view.frame.width
        let interItemOffset: Double = 10
        let collectionViewOffset: Double = 10 * 2
        let cellWidth = (Double(viewWidth) - interItemOffset - collectionViewOffset) / 2
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

extension MotivatorsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return motivators.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MotivatorCollectionViewCell.identifier,
                                                      for: indexPath) as! MotivatorCollectionViewCell
        let currentMotivator = motivators[indexPath.row]
        cell.nameLabel.text = currentMotivator.name
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: currentMotivator.imageUrl) else {
                return
            }
            if let data = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    cell.motivatorImageView.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
}

extension MotivatorsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

private extension MotivatorsViewController {
    func setupView() {
        self.view.backgroundColor = .white
        self.setupNavigationItem()
        self.setupMotivatorsCollectionView()
    }
    
    func setupNavigationItem() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "Мотиваторы"
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = "Назад"
        backBarButtonItem.target = self
        backBarButtonItem.action = #selector(self.backBarButtonPressed)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    func setupMotivatorsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.motivatorsCollectionView = UICollectionView(frame: .zero,
                                                         collectionViewLayout: layout)
        self.view.addSubview(self.motivatorsCollectionView)
        self.motivatorsCollectionView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        self.motivatorsCollectionView.delegate = self
        self.motivatorsCollectionView.dataSource = self
        self.motivatorsCollectionView.register(MotivatorCollectionViewCell.self,
                                               forCellWithReuseIdentifier: MotivatorCollectionViewCell.identifier)
        self.motivatorsCollectionView.backgroundColor = .white
    }
    
    @objc func backBarButtonPressed() {
        self.router.dismissViewController(self)
    }
}
