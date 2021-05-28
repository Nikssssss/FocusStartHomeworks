//
//  MotivatorsCellPresenter.swift
//  Autobiography
//
//  Created by Никита Гусев on 28.05.2021.
//

import Foundation
import class UIKit.UIImage
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGFloat

protocol MotivatorsCellPresenterProtocol: class {
    func cellWillAppear(cell: MotivatorsCellProtocol, indexPath: IndexPath)
    func sizeForItem(at indexPath: IndexPath, viewWidth: CGFloat) -> CGSize
    var minimumInteritemSpacing: CGFloat { get }
}

class MotivatorsCellPresenter: MotivatorsCellPresenterProtocol {
    var minimumInteritemSpacing: CGFloat {
        return CGFloat(MotivatorsConstants.collectionViewInterItemOffset)
    }
    
    private let motivatorsService: MotivatorsServiceProtocol
    
    init(motivatorsService: MotivatorsServiceProtocol) {
        self.motivatorsService = motivatorsService
    }
    
    func cellWillAppear(cell: MotivatorsCellProtocol, indexPath: IndexPath) {
        guard let motivator = self.motivatorsService.getMotivator(at: indexPath.row) else {
            return
        }
        let motivatorViewInfo = MotivatorsMapper.mapToViewInfo(motivator)
        
        cell.setNameLabelText(motivatorViewInfo.name)
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: motivatorViewInfo.imageUrl) else { return }
            if let data = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        cell.setMotivatorImage(image)
                    }
                }
            }
        }
    }
    
    func sizeForItem(at indexPath: IndexPath, viewWidth: CGFloat) -> CGSize {
        if indexPath.row > 0 && indexPath.row < self.motivatorsService.numberOfMotivators {
            let interItemOffset = MotivatorsConstants.collectionViewInterItemOffset
            let collectionViewOffset = MotivatorsConstants.collectionViewLeftOffset + MotivatorsConstants.collectionViewRightOffset
            let cellWidth = (Double(viewWidth) - interItemOffset - collectionViewOffset) / 2
            return CGSize(width: cellWidth, height: cellWidth)
        } else {
            return .zero
        }
    }
}
