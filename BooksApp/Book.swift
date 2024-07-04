import Foundation
import UIKit

struct Book: Hashable, Identifiable, Codable {
    let id = UUID()
    let image: UIImage
    let name: String
    let author: String
    let bio: String
    
    init(image: UIImage, name: String, author: String, bio: String) {
        self.image = image
        self.name = name
        self.author = author
        self.bio = bio
    }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            let imageData = image.pngData()
            try container.encode(imageData, forKey: .image)
            try container.encode(name, forKey: .name)
            try container.encode(author, forKey: .author)
            try container.encode(bio, forKey: .bio)
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let imageData = try container.decode(Data.self, forKey: .image)
            guard let image = UIImage(data: imageData) else {
                throw DecodingError.dataCorruptedError(forKey: .image, in: container, debugDescription: "Invalid image")
            }
            self.image = image
            self.name = try container.decode(String.self, forKey: .name)
            self.author = try container.decode(String.self, forKey: .author)
            self.bio = try container.decode(String.self, forKey: .bio)
        }
        
        private enum CodingKeys: String, CodingKey {
            case image, name, author, bio
        }
}
