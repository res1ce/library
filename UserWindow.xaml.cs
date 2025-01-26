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
    /// Логика взаимодействия для UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        private readonly User _currentUser;
        public UserWindow(User user)
        {
            InitializeComponent();
            _currentUser = user;
            LoadBooks();
        }

        private void LoadBooks()
        {
            List<Book> books = BookService.GetAvailableBooks();
            BooksListView.ItemsSource = books;
        }

        private void RentBookButton_Click(object sender, RoutedEventArgs e)
        {
            if (BooksListView.SelectedItem is Book selectedBook)
            {
                bool success = BookService.RentBook(selectedBook.Id, _currentUser.Id);
                if (success)
                {
                    MessageBox.Show("Книга взята в прокат!");
                    LoadBooks();
                }
                else
                {
                    MessageBox.Show("Ошибка взятия книги в прокат.");
                }
            }
            else
            {
                MessageBox.Show("Пожалуйста выберите книгу.");
            }
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }
    }
}
