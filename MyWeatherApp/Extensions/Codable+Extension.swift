//
//  Codable+Extension.swift
//  MyWeatherApp
//
//  Created by Esat Kemal Ekren on 26/10/2023.
//

import Foundation

// MARK: - DateTimeFormat

enum DateTimeFormat: String {
    case timeZoneFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
    case timeZoneFormatWithoutMS = "yyyy-MM-dd'T'HH:mm:ssZ"
    case noTimeZoneFormat = "yyyy-MM-dd'T'HH:mm:ss.S"
}

extension Encodable {
    // Produces dictionary from encodable
    var dictionary: [String: Any]? {
        let encoder = JSONEncoder()
        let formatter = DateFormatter()
        formatter.dateFormat = DateTimeFormat.timeZoneFormat.rawValue

        encoder.dateEncodingStrategy = .formatted(formatter)
        guard let data = try? encoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }

    // Produces dictionary from encodable
    var stringDictionary: [String: String]? {
        let encoder = JSONEncoder()
        let formatter = DateFormatter()
        formatter.dateFormat = DateTimeFormat.timeZoneFormat.rawValue
        encoder.dateEncodingStrategy = .formatted(formatter)
        guard let data = try? encoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: String] }
    }

    /// - Returns: Json string from encodable using default encoder.
    var asJSON: String? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    /// - Returns: Default json string from encodable as data.
    var asData: Data? {
        asJSON?.data(using: .utf8)
    }
}

extension Decodable {
    ///
    /// Tries to parse json string and make instance of decodable.
    ///
    /// - Parameters:
    ///   - jsonString: string in json format with all required properties.
    /// - Returns: new instance of decodable based on provided json string.
    static func from(jsonString: String?) -> Self? {
        guard let json = jsonString else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(Self.self, from: json.data(using: .utf8)!)
    }
}
