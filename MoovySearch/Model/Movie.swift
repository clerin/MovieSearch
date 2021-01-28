//
//  Movie.swift
//  MoovySearch
//
//  Created by Clerin on 1/28/21.
//

import Foundation


// MARK: - Movie
struct Movie: Codable {
    var title, year, rated, released: String?
    var runtime, genre, director, writer: String?
    var actors, plot, language, country: String?
    var awards: String?
    var poster: String?
    var ratings: [Rating]?
    var metascore, imdbRating, imdbVotes, imdbID: String?
    var type, dvd, boxOffice, production: String?
    var website, response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}

// MARK: Welcome convenience initializers and mutators

extension Movie {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Movie.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        title: String?? = nil,
        year: String?? = nil,
        rated: String?? = nil,
        released: String?? = nil,
        runtime: String?? = nil,
        genre: String?? = nil,
        director: String?? = nil,
        writer: String?? = nil,
        actors: String?? = nil,
        plot: String?? = nil,
        language: String?? = nil,
        country: String?? = nil,
        awards: String?? = nil,
        poster: String?? = nil,
        ratings: [Rating]?? = nil,
        metascore: String?? = nil,
        imdbRating: String?? = nil,
        imdbVotes: String?? = nil,
        imdbID: String?? = nil,
        type: String?? = nil,
        dvd: String?? = nil,
        boxOffice: String?? = nil,
        production: String?? = nil,
        website: String?? = nil,
        response: String?? = nil
    ) -> Movie {
        return Movie(
            title: title ?? self.title,
            year: year ?? self.year,
            rated: rated ?? self.rated,
            released: released ?? self.released,
            runtime: runtime ?? self.runtime,
            genre: genre ?? self.genre,
            director: director ?? self.director,
            writer: writer ?? self.writer,
            actors: actors ?? self.actors,
            plot: plot ?? self.plot,
            language: language ?? self.language,
            country: country ?? self.country,
            awards: awards ?? self.awards,
            poster: poster ?? self.poster,
            ratings: ratings ?? self.ratings,
            metascore: metascore ?? self.metascore,
            imdbRating: imdbRating ?? self.imdbRating,
            imdbVotes: imdbVotes ?? self.imdbVotes,
            imdbID: imdbID ?? self.imdbID,
            type: type ?? self.type,
            dvd: dvd ?? self.dvd,
            boxOffice: boxOffice ?? self.boxOffice,
            production: production ?? self.production,
            website: website ?? self.website,
            response: response ?? self.response
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Rating
struct Rating: Codable {
    var source, value: String?

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

// MARK: Rating convenience initializers and mutators

extension Rating {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Rating.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        source: String?? = nil,
        value: String?? = nil
    ) -> Rating {
        return Rating(
            source: source ?? self.source,
            value: value ?? self.value
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
