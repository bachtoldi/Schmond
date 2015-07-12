using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schmond.Models {
    public class UserOverview {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public int? CharsId { get; set; }
    }
}