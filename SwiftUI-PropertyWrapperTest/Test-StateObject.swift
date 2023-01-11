//
//  Test-StateObject.swift
//  SwiftUI-PropertyWrapperTest
//
//  Created by Marcy Vernon on 1/8/23.
//

import SwiftUI

class Movie: ObservableObject {
	
	@Published var title       : String = "The Shawshank Redemption"
	@Published var genre 		   : String = "Drama"
	@Published var year		     : String = "1994"
	@Published var rating      : String = "R"
	@Published var description : String = "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency."

}


/// Main view for this section
struct TestStateObjectView: View {
	
	@StateObject var movie = Movie()
	
	var body: some View {
		VStack {
			Text("@StateObject").font(.title)
			Text("used to contain properties in one shared object").font(.caption)
			
			Spacer()
			
			ZStack {
				Rectangle()
					.fill(Color.blue)
					.frame(height: 250)
				VStack (alignment: .leading) {
					Text("Movie: \(movie.title)")
					Text("Genre: \(movie.genre)")
					Text("Year: \(movie.year)")
					Text("Rating: \(movie.rating)")
					Text("Description: \(movie.description)")
				}
				.foregroundColor(Color.white)
				.padding()
			}
			
			Spacer()
			
			VStack (alignment: .leading) {
				TextField("Movie", text: $movie.title)
				TextField("Genre", 	text: $movie.genre)
				TextField("Year", 	text: $movie.year)
				TextField("Rating", 		text: $movie.rating)
				TextField("Description", 	text: $movie.description, axis: .vertical)
			}

			Spacer()
			
			Text("The bottom fields are editable.")
				.font(.caption)
		}
		.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
	}
}


