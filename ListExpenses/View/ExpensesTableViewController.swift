//
//  ExpensesTableViewController.swift
//  ListExpenses
//
//  Created by Максим Гурков on 16.06.2022.
//

import UIKit

class ExpensesTableViewController: UITableViewController {
    
    var expense: Expense!
    
    var expenses: [Expenses]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

    }
    
    private func setupNavigationBar() {
        title = expense.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(newExpense))
    }
    
    
    
    @objc private func newExpense() {
        alert()
    }
    
    private func alert() {
        let alert = UIAlertController(
            title: "Внимание",
            message: "Добавьте расход",
            preferredStyle: .alert)
        let newExpenseAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            guard let newName = alert.textFields?.first?.text, !newName.isEmpty else { return }
            guard let newSum = alert.textFields?.last?.text, !newSum.isEmpty else { return }
            
            let newExpense = Expenses(name: newName, sum: Int(newSum) ?? 0)
            self.expenses.append(newExpense)
            self.tableView.insertRows(at: [IndexPath(row: (self.expenses.count) - 1, section: 0)], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "Назад", style: .destructive)
        alert.addAction(newExpenseAction)
        alert.addAction(cancelAction)
        alert.addTextField { textField in
            textField.placeholder = "Имя расхода"
        }
        alert.addTextField { textField in
            textField.placeholder = "Сумма "
        }
        present(alert, animated: true)
    }
    
    
    
}
    
// MARK: - Table view data source
extension ExpensesTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExpense", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let expense = expenses[indexPath.row]
        content.text = expense.name
        content.secondaryText = "\(expense.sum)"
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
