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
    
    func testMovieCapsule() {
        downloadExpectation = expectation(description: "Valid movie list object")
        MoviesCapsule.shared.downloadMovies(page: 1, completion: {
            XCTAssertNotNil(MoviesCapsule.shared.moviesList, "Expected a MovieList")
            if let movieId = MoviesCapsule.shared.moviesList?.results.first?.identifier {
                MoviesCapsule.shared.downloadCredits(movieId: movieId , completion: {
                    XCTAssertNotNil(MoviesCapsule.shared.credits, "Expected the credits of movie")
                    self.downloadExpectation?.fulfill()
                })
            } else {
                XCTFail("Couldn't get movie to see credits")
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
}
