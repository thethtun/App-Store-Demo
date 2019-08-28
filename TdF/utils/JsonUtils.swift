//
//  JsonUtils.swift
//  TdF
//
//  Created by Thet Htun on 8/28/19.
//  Copyright © 2019 blahblahblah. All rights reserved.
//

import Foundation

class JsonUtils {
    static func loadJson<T : Decodable>(filename fileName: String) -> [T]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([T].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
