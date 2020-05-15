//
//  RepositoriesViewModelTest.swift
//  RepositoriosSwiftAPITests
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

@testable import RepositoriosSwiftAPI
import Nimble
import Quick

class RepositoriesViewModelTest: QuickSpec {
    
    private var subject = RepositoriesViewModel()
    private let item = SwiftRepositories(items: [SwiftRepositoriesItems(name: "Alamofire", stars: 33485, owner: SwiftRepositoriesOwners(ownerImage: "OwnerImage", ownerName: "AlamofireOwnerName"))])
    private let sessions = 1
    private let rowHeight = CGFloat(180)
    private let repositoryStars = 33485
    private let repositoryName = "Alamofire"
    private let ownerName = "AlamofireOwnerName"
    private let ownerImage = "OwnerImage"
    
    private let kZero: Int = 0
    private let kOne: Int = 1
    
    override func spec() {
        
        beforeEach {
            self.subject = RepositoriesViewModel()
            self.subject.swiftRepositories = self.item.items
        }
        
        describe("RepositoriesViewModelTest bahavior unit tests") {
            
            it("Should validate number of rows in section") {
                expect(self.subject.getNumberOfRowsInSection()).notTo(beNil())
                expect(self.subject.getNumberOfRowsInSection()).to(equal(self.kOne))
                
                self.subject.swiftRepositories = []
                expect(self.subject.getNumberOfRowsInSection()).to(equal(self.kZero))
            }
            
            it("Should validate number of sections") {
                expect(self.subject.getNumberOfSections()).notTo(beNil())
                expect(self.subject.getNumberOfSections()).to(equal(self.sessions))
            }
            
            it("Should validate repository name") {
                expect(self.subject.getRepositoryName(index: self.kZero)).notTo(beNil())
                expect(self.subject.getRepositoryName(index: self.kZero)).to(equal(self.repositoryName))
            }
            
            it("Should validate repository stars") {
                expect(self.subject.getRepositoryStars(index: self.kZero)).notTo(beNil())
                expect(self.subject.getRepositoryStars(index: self.kZero)).to(equal(self.repositoryStars))
            }
            
            it("Should validate owner name") {
                expect(self.subject.getOwnerName(index: self.kZero)).notTo(beNil())
                expect(self.subject.getOwnerName(index: self.kZero)).to(equal(self.ownerName))
            }
            
            it("Should validate owner image") {
                expect(self.subject.getOwnerImage(index: self.kZero)).notTo(beNil())
                expect(self.subject.getOwnerImage(index: self.kZero)).to(equal(self.ownerImage))
            }
            
            it("Should validate height for row") {
                expect(self.subject.getHeightForRow()).notTo(beNil())
                expect(self.subject.getHeightForRow()).to(equal(self.rowHeight))
            }
            
        }
    }
    
}
