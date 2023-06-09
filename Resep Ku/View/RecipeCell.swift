//
//  RecipeCell.swift
//  Resep Ku
//
//  Created by Anang Kurniawan on 01/06/23.
//

import UIKit

class RecipeCell: UITableViewCell, ThumbnailManagerDelegate {

    @IBOutlet weak var ivRecipe: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labeltag: UILabel!
    
    private var thumbnailManager = ThumbnailManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailManager.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdateThumbnail(data: Data) {
        DispatchQueue.main.async {
            self.ivRecipe.image = UIImage(data: data)
        }
    }
    
    func fetchImage(urlString: String) {
        thumbnailManager.fetchThumbnail(urlString: urlString)
    }
}
