using Library.Models;
using Library.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Library
{
    /// <summary>
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
            LoadBooks();
        }

        private void LoadBooks()
        {
            List<Book> books = BookService.GetAvailableBooks();
            BooksDataGrid.ItemsSource = books;
        }

        private void AddBookButton_Click(object sender, RoutedEventArgs e)
        {
            string title = "New Book";
            string author = "Author Name";
            if (BookService.AddBook(title, author))
            {
                MessageBox.Show("Книга добавлена!");
                LoadBooks();
            }
            else
            {
                MessageBox.Show("Ошибка добавления.");
            }
        }

        private void DeleteBookButton_Click(object sender, RoutedEventArgs e)
        {
            if (BooksDataGrid.SelectedItem is Book selectedBook)
            {
                if (BookService.DeleteBook(selectedBook.Id))
                {
                    MessageBox.Show("Книга успешно удалена!");
                    LoadBooks();
                }
                else
                {
                    MessageBox.Show("Ошибка удаления.");
                }
            }
            else
            {
                MessageBox.Show("Выберите книгу");
            }
        }

        private void BooksDataGrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
        {
            if (e.EditAction == DataGridEditAction.Commit)
            {
                Book editedBook = e.Row.Item as Book;
                if (editedBook != null)
                {
                    bool result = BookService.UpdateBook(editedBook);
                    if (result)
                    {
                        MessageBox.Show($"Книга '{editedBook.Title}' успешно обновлена!", "Success");
                    }
                    else
                    {
                        MessageBox.Show("Ошибка обновления книги.", "Error");
                    }
                }
            }
        }

        private void ViewRentalsButton_Click(object sender, RoutedEventArgs e)
        {
            List<(Rental rental, Book book, User user)> rentedBooks = BookService.GetRentedBooks();

            string rentalInfo = "Rented Books:\n";
            foreach (var (rental, book, user) in rentedBooks)
            {
                rentalInfo += $"Книга: {book.Title}, Логин: {user.Username}, Дата взятия: {rental.RentalDate}\n";
            }

            MessageBox.Show(rentalInfo, "Rental List");
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }
    }
}
