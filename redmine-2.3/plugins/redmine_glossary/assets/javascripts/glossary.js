function promptToRemote(text, param, url, auth) {
      value = prompt(text + ':');
      if (value) {
          data = param+'='+value+'&'+auth;
          $.ajax({
            url: url+".js",
            type: "POST",
            data: data,
            dataType: 'script'
          });
          return false;
      }
}