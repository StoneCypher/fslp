
_UrlProtocol
  = 'hsts://'
  / 'http://'
  / 'https://'

URL "url"
  = protocol:_UrlProtocol [a-zA-Z0-9\!\*\'\(\)\:\;\@\&\=\+\$\,\/\?\#\[\]\_\.\~\-]+ { return { term: "URL", value: text(), location: location() }; }
