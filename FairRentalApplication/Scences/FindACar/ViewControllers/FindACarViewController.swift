//
//  FindACarViewController.swift
//  FairRentalApplication
//
//  Created by Arbi on 3/25/18.
//  Copyright © 2018 org.fair. All rights reserved.
//

import UIKit

enum SortingType{
    case ByCompany
    case ByDistance
    case ByPrice
    case Ascending
    case Descending
}

protocol FindACarViewControllerInput: FindACarPresenterOutput{
    func showAllCars(viewModel:FindACarViewModel)
}

protocol FindACarViewControllerOutput{
    //func sortCarsBy(sortingType: SortingType)
      func fetchItems(request: FindACarRequest)
      var locationInfo:[Double] {get set}
}

class FindACarViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    public var output: FindACarViewControllerOutput!
    public var router: FindACarRouter!
    
    let refreshControl = UIRefreshControl()
    let apiHandler = APIHandler()
    let reuseID = "FindACarCell"
    fileprivate var albumsViewModels: [FindACarViewModel] = []
    
    //Mark: Object Creation
    override func awakeFromNib(){
        super.awakeFromNib()
        FindACarConfigurator.sharedInstance.configure(viewController: self)
    }
    func configureCell(){
        let unib = UINib(nibName: "FindACarTableViewCell", bundle: nil)
        self.tableView.register(unib, forCellReuseIdentifier: reuseID)
    }
 
    func showAllCars(viewModel: FindACarViewModel) {
    }
    
    func createAFindRequest(){
       let request = FindACarRequest()
        output.fetchItems(request: request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        configureCell()
        var findCarRequest = FindACarRequest()
        findCarRequest.radius = 42
        output.fetchItems(request: FindACarRequest())
    }

    func successFetchedItems(viewModel: FindACarViewModel) {
        print(viewModel.fetchedResultData)
        
    }
    
    func errorFetchingItems(viewModel: FindACarViewModel) {
        print("error Fetching")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FindACarViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard  let findACarCell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? FindACarTableViewCell else{
            return UITableViewCell()
        }
        findACarCell.layoutSubviews()
            return findACarCell
        
    }
    
}
extension FindACarViewController: FindACarViewControllerInput {
    
    func displayAlbums(viewModels: [FindACarViewModel]) {
        
        albumsViewModels = viewModels
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func displayError(viewModel: ErrorViewModel) {
        
        self.refreshControl.endRefreshing()
        //self.presentError(viewModel: viewModel)
    }
}

