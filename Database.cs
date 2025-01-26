using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Library
{
    public static class Database
    {
        public static MySqlConnection GetConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString;
            return new MySqlConnection(connectionString);
        }
    }

}
