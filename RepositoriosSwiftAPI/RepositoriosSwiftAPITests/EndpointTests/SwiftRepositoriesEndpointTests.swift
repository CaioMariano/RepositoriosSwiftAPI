//
//  SwiftRepositoriesEndpointTests.swift
//  RepositoriosSwiftAPITests
//
//  Created by Caio Araujo Mariano on 14/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

@testable import RepositoriosSwiftAPI
import Nimble
import Quick

class SwiftRepositoriesEndpointTests: QuickSpec {
    
    private let swiftRepositories = SwiftRepositoriesEndpoints.getSwiftRepositories(page: 1)
    private let path = "/search/repositories"
    private let host = "api.github.com"
    private let schme = "https"
    private let queryItems = [URLQueryItem(name: "q", value: "language:swift"),
                              URLQueryItem(name: "sort", value: "stars"),
                              URLQueryItem(name: "page", value: "1")]
    
    override func spec() {
        
        describe("Swift repositories endpoints behavior unit tests") {
            
            it("Should validate path") {
                expect(self.swiftRepositories.path).notTo(beNil())
                expect(self.swiftRepositories.path).to(equal(self.path))
            }
            
            it("Should validate query items") {
                expect(self.swiftRepositories.queryItems).notTo(beNil())
                expect(self.swiftRepositories.queryItems).to(equal(self.queryItems))
            }
            
            it("Should validate request method") {
                expect(self.swiftRepositories.method).notTo(beNil())
                expect(self.swiftRepositories.method).to(equal(.get))
            }
            
            it("Should validate host") {
                expect(self.swiftRepositories.host).notTo(beNil())
                expect(self.swiftRepositories.host).to(equal(self.host))
            }
            
            it("Should validate scheme") {
                expect(self.swiftRepositories.components.scheme).notTo(beNil())
                expect(self.swiftRepositories.components.scheme).to(equal(self.schme))
            }
            
        }
        
    }
}
