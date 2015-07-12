using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schmond.Models {
    public static class ModelFactory {
        public static UserOverview UserToUserOverview(User user) {
            return new UserOverview() {
                Id = user.Id,
                UserName = user.UserName,
                Email = user.Email,
                CharsId = user.CharsId
            };
        }
    }
}