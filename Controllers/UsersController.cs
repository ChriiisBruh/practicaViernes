using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using practicabackend.Data;
using practicabackend.Models;

namespace practicabackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController
    {
        [HttpGet]
        public async Task<ActionResult<List<Musers>>> GetUsers()
        {
            var function = new Dusers();
            var list = await function.GetMusers();
            return list;

        }

    }
}
