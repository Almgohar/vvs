//
//  StationEntity.swift
//  vvs
//
//  Created by Alaa Maher on 19/05/2021.
//

struct StationEntity: Codable {
	var name: String
	var city: String
	var type: StationType
	var stopPointRef: String
	var location: Location
}

struct Location: Codable {
	var longitude: Float
	var latitude: Float
}

enum StationType: Int, Codable {
	case ubahn
	case sbahn
	case bus
}
