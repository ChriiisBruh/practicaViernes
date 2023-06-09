using practicabackend.Connection;
using practicabackend.Models;
using System.Data;
using System.Data.SqlClient;

namespace practicabackend.Data
{
    public class Dusers
    {
        ConnectionDB cn = new ConnectionDB();
        public async Task<List<Musers>> GetMusers()
        {
            var list = new List<Musers>();
            using (var sql = new SqlConnection(cn.stringSQL()))
            {
                using (var cmd = new SqlCommand("getUsers", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var musers = new Musers();
                            musers.id = (int)reader["id"];
                            musers.name = (string)reader["name"];
                            musers.faculty = (string)reader["faculty"];
                            musers.cantReservesLastMonth = (int)reader["cantReservesLastMonth"];
                            list.Add(musers);

                        }

                    }
                }
            }
            return list;

        }

        //public async Task<List<Mbooks>> GetMbooks()
        //{
        //    var list = new List<Mbooks>();
        //    using (var sql = new SqlConnection(cn.stringSQL()))
        //    {
        //        using (var cmd = new SqlCommand("getBooksById", sql))
        //        {
        //            await sql.OpenAsync();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            using (var reader = await cmd.ExecuteReaderAsync())
        //            {
        //                while (await reader.ReadAsync())
        //                {
        //                    var mbooks = new Mbooks();
        //                    mbooks.id = (int)reader["id"];
        //                    list.Add(mbooks);

        //                }

        //            }
        //        }
        //    }
        //    return list;

        //}
    }
}
