//
//  filmes_popularesTests.swift
//  filmes_popularesTests
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import XCTest
@testable import filmes_populares

class filmes_popularesTests: XCTestCase {
    
    var downloadExpectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        downloadExpectation = nil
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDownloadList() {
        downloadExpectation = expectation(description: "Valid movie list object")
        MoviesCapsule.shared.downloadMovies(page: 1, completion: {
            XCTAssertNotNil(MoviesCapsule.shared.moviesList, "Expected a MovieList")
            MoviesCapsule.shared.downloadCredits(completion: <#T##() -> Void#>)
            
            self.downloadExpectation?.fulfill()
        })
    }
    
    func testDownloadCredit() {
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
