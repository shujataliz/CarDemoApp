//
//  ContentView.swift
//  CarAssignment
//
//  Created by Shujat Ali on 31/10/2023.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var viewModel: ListViewModel = ListViewModel()
    
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.carItems) { car in
                NavigationLink(
                    destination: CarDetailScreen(car: car),
                    label: {
                        VStack(alignment:.leading) {
                            Text(car.title)
                            Text(car.description)
                                .foregroundColor(.secondary)
                        }
                    })
            }
        }
        .task {
            do {
                try await viewModel.fetchCars()
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
