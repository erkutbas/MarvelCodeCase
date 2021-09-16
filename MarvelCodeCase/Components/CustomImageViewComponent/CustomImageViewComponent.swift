//
//  CustomImageViewComponent.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 15.09.2021.
//

import UIKit

class CustomImageViewComponent: UIImageView {
    
    private var imageUrlString: String?
    
    func setData(componentData: CustomImageViewComponentData) {
        DispatchQueue.main.async { [weak self] in
            switch componentData.loadingType {
            case .memory:
                self?.imageLoadingProcess(componentData: componentData)
            case .disk:
                self?.loadImageFromDiskWith(componentData: componentData)
            }
        }
        
    }
    
    private func fireImageDownloadingRequest(_ url: URL, _ componentData: CustomImageViewComponentData) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error : \(String(describing: error))")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.handleTaskResponse(data: data, componentData: componentData)
            }
            
        }.resume()
    }
    
    private func imageLoadingProcess(componentData: CustomImageViewComponentData) {
        imageUrlString = componentData.imageUrl
        
        image = nil
        
        if let cachedImage = returnImageFromCache(imageUrl: componentData.imageUrl) {
            image = cachedImage
            return
        }
        
        guard let url = URL(string: componentData.imageUrl) else { return }
        
        fireImageDownloadingRequest(url, componentData)
    }
    
    private func handleTaskResponse(data: Data?, imageUrl: String) {
        guard let data = data, let image = UIImage(data: data) else { return }
        
        if self.imageUrlString == imageUrl {
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
                self?.image = image
            }
        }
        
        setImageToCache(key: imageUrl, object: image)
        
    }
    
    private func handleTaskResponse(data: Data?, componentData: CustomImageViewComponentData) {
        guard let data = data, let image = UIImage(data: data) else { return }
        
        if self.imageUrlString == componentData.imageUrl {
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
                self?.image = image
            }
        }
        
        switch componentData.loadingType {
        case .memory:
            setImageToCache(key: componentData.imageUrl, object: image)
        case .disk:
            saveImage(imageName: componentData.imageId!, image: image)
        }
        
    }
    
    private func returnImageFromCache(imageUrl: String) -> UIImage? {
        guard let cachedImage = ImageCacheManager.returnImagesFromCache(key: imageUrl) else { return nil }
        return cachedImage
    }
    
    private func setImageToCache(key: String, object: UIImage) {
        ImageCacheManager.setImagesToCache(object: object, key: key)
    }
    
    private func saveImage(imageName: String, image: UIImage) {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
            
        }
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
        
    }
    
    private func loadImageFromDiskWith(componentData: CustomImageViewComponentData) {
        
        imageUrlString = componentData.imageUrl
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(componentData.imageId!)
            if let image = UIImage(contentsOfFile: imageUrl.path) {
                self.image = image
            } else {
                guard let url = URL(string: componentData.imageUrl) else { return }
                fireImageDownloadingRequest(url, componentData)
            }
        } else {
            guard let url = URL(string: componentData.imageUrl) else { return }
            fireImageDownloadingRequest(url, componentData)
        }
        
    }
    
}

