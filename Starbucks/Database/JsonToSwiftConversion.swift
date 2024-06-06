//
//  JsontoSwiftConversion.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/06/06.
//

import Foundation

final class ConvertJsonToModel {

    class func convert<Model: Codable>(fromFileName file: String) -> Model? {
        do {
            let data = try fetchJsonData(inFile: file)
            let model: Model = try JSONDecoder().decode(Model.self, from: data)
            return model
        } catch {
            
        }
        
        return nil
    }
    
    static private func fetchJsonData(inFile file: String) throws -> Data {
        let path = Bundle(for: self).path(forResource: file, ofType: "json")
        return try Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
    }
}
