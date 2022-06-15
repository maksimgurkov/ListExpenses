//
//  MyListExpensesTableViewController.swift
//  ListExpenses
//
//  Created by Максим Гурков on 15.06.2022.
//

import UIKit

class MyListExpensesTableViewController: UITableViewController {
    
    var expenses: [Expense] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    // MARK: - SetupNavigationBar
    
    private func setupNavigationBar() {
        title = "Мои расходы"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(newExpenses)
        )
    }
    
    private func alert() {
        let alert = UIAlertController(
            title: "Внимание",
            message: "Добавьте позицию расходов",
            preferredStyle: .alert
        )
        let newExpenseAction = UIAlertAction(title: "Добавит", style: .default) { _ in
            guard let nameExpense = alert.textFields?.first?.text, !nameExpense.isEmpty else {return}
            let newExpense = Expense(name: nameExpense)
            self.expenses.append(newExpense)
            self.tableView.insertRows(at: [IndexPath(row: self.expenses.count - 1, section: 0)], with: .automatic)
        }
        let cancel = UIAlertAction(title: "Назад", style: .destructive)
        alert.addAction(newExpenseAction)
        alert.addAction(cancel)
        alert.addTextField { textField in
            textField.placeholder = "Имя расхода"
        }

        present(alert, animated: true)
        
    }
    
    @objc private func newExpenses() {
        alert()
    }
}

extension MyListExpensesTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        let expense = expenses[indexPath.row]
        content.text = expense.name
        content.secondaryText = "\(expense.id)"
        cell.contentConfiguration = content

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
