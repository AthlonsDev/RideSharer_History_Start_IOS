//
//  RideHistoryViewController.swift
//  RideSharer
//
//

import UIKit

class RideHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let cellRow = "rideHistoryCell"
    
    let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
                       ("Driver: Sandra, 01/03/2022", "$13.10"),
                       ("Driver: Hank, 01/11/2022", "$16.20"),
                       ("Driver: Michelle, 01/19/2022", "$8.50")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellRow)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func alertBox() {
        let alertController = UIAlertController(title: "Ride History", message:"OK", preferredStyle: UIAlertControllerStyle.alert)
        self.present(alertController, animated: true, completion: nil)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlert, handler: { action in 
            self.dismiss(animated: true, completion:nil)
        }))
        alertController.addAction(UIAlertAction(title: "Close", style: UIAlert, handler: {
            action in
            self.dismiss(animated: true, completion: nil)
        }))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rideHistory.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell

        guard let cell = selectedCell else { return }
        alertBox(cell.title)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = dequeueReusableCell(withIdentifier: cellRow, for: indexPath) as UITableView

        let (driver, rate) = rideHistory[indexPath.row]
        cell.textLabel?.text = driver
        cell.detailTextLabel?.text = rate

    }
        
}
