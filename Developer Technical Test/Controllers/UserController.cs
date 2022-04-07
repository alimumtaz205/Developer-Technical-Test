using BookPortalAPI.Models.Users.Request;
using BookPortalAPI.Models.Users.Response;
using Developer_Technical_Test.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Developer_Technical_Test.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;

        public UserController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [Route("[action]")]
        [HttpGet]
        public async Task<IActionResult> GetUser()
        {
            GetUserResponse response = new GetUserResponse();
            try
            {
                response = _userRepository.GetUser();
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.Message = ex.Message.ToString();
                // response.ResCode = Convert.ToString((int)TranCodes.Exception);
            }

            return Ok(response);
        }

        [HttpPost]
        [Route("Registration")]
        public async Task<IActionResult> AddUser([FromBody] AddUserRequest request)
        {
            AddUserResponse response = new AddUserResponse();
            try
            {
                response = _userRepository.AddUser(request);
                // response.ResCode = C;
                //response.IsSuccess = true;
                //response.Message = "Success";
            }
            catch (Exception ex)
            {
                response.Message = ex.Message.ToString();
                // response.ResCode = Convert.ToString((int)TranCodes.Exception);
            }

            return Ok(response);
        }

        [Route("[action]")]
        [HttpPost]
        public async Task<IActionResult> DeleteUser([FromBody] DeleteUserRequest request)
        {
            DeleteUserResponse response = new DeleteUserResponse();
            try
            {
                response = _userRepository.DeleteUser(request);
            }
            catch (Exception ex)
            {
                response.Message = ex.Message.ToString();
                //response.ResCode = TransactionCodes.DELETE_BUNDLE_ERROR;
            }
            return Ok(response);
        }

        [Route("[action]")]
        [HttpPost]
        public async Task<IActionResult> UpdateUser([FromBody] UpdateUserRequest request)
        {
            UpdateUserResponse response = new UpdateUserResponse();
            try
            {
                response = _userRepository.UpdateUser(request);
            }
            catch (Exception ex)
            {
                response.Message = ex.Message.ToString();
                //response.ResCode = Common.TransactionCodes.UPDATE_ACTIVITY_ERROR;
            }
            return Ok(response);
        }
    }
}
