using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;

namespace Ntlm.Pages
{
    public class PrivacyModel : PageModel
    {
        private readonly ILogger<PrivacyModel> _logger;
        public string Name;

        public PrivacyModel(ILogger<PrivacyModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }

        public void OnPost()
        {
            _logger.Log(LogLevel.Error, "You posted bitch");
        }

        public void OnPostSubmit(PersonModel person)
        {
            this.Name = string.Format("Name: {0} {1}", person.FirstName, person.LastName);
            _logger.Log(LogLevel.Error, "You posted words");
            _logger.Log(LogLevel.Error, "More words");

        }
    }

    public class PersonModel
    {
        [BindProperty]
        public string FirstName { get; set; }

        [BindProperty]
        public string LastName { get; set; }
    }
}