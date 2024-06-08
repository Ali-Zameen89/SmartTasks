//
//  TasksWorker.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

struct TasksWorker {
  
  private let remoteDataSource: TasksRemoteDataSourceProtocol
  
  init(remoteDataSource: TasksRemoteDataSourceProtocol = TasksRemoteDataSource()) {
    self.remoteDataSource = remoteDataSource
  }
}

extension TasksWorker: TasksWorkerProtocol {
  
  func fetchTasks(completion: @escaping (TasksResponse) -> Void) {
    
    remoteDataSource.fetchTasks { taskResponse in
      completion(taskResponse)
    }
    
//    return Observable.create { observer in
//      self.raffleDataRepository.fetchRaffleData()
//        .subscribe(onNext: { raffleData in
//          observer.onNext(raffleData)
//        }, onError: { error in
//          observer.onError(error)
//        }, onCompleted: {
//          observer.onCompleted()
//        })
//        .disposed(by: disposeBag)
//      
//      return Disposables.create()
  }
}
