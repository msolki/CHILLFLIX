//
//  DataPersistenceManager.swift
//  CHILLFLIX
//
//  Created by Mohammad Solki on 28/03/24.
//
import CoreData
import UIKit

/// A manager class responsible for handling data persistence operations.
class DataPersistenceManager {
    
    /// An enumeration representing the possible errors that can occur during database operations.
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetachData
        case failedToDeleteData
    }
    
    /// The shared instance of the `DataPersistenceManager`.
    static let shared = DataPersistenceManager()
    
    /// Downloads a title and saves it to the database.
    /// - Parameters:
    ///   - model: The `Title` object to be downloaded and saved.
    ///   - completion: A closure that gets called when the download and save operation is completed. It returns a `Result` object indicating whether the operation was successful or not.
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> ()) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.id = Int64(model.id)
        item.original_title = model.original_title
        item.original_name = model.original_name
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.posterPath
        item.release_date = model.release_date
        item.vote_count = Int64(model.vote_count)
        item.vote_average = model.vote_average
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
    
    /// Fetches all titles from the database.
    /// - Parameter completion: A closure that gets called when the fetch operation is completed. It returns a `Result` object containing an array of `TitleItem` objects if the operation was successful, or an error if it failed.
    func fetchTitlesFromDatabase(completion: @escaping (Result<[TitleItem], Error>) -> ()) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = TitleItem.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DatabaseError.failedToFetachData))
        }
    }
    
    /// Deletes a title from the database.
    /// - Parameters:
    ///   - model: The `TitleItem` object to be deleted.
    ///   - completion: A closure that gets called when the delete operation is completed. It returns a `Result` object indicating whether the operation was successful or not.
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>) -> ()) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToDeleteData))
        }
        
    }
    
    /// Private initializer to prevent creating instances of `DataPersistenceManager` from outside the class.
    private init() {}
    
}
