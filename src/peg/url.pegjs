
_UrlProtocol
  = 'hsts'
  / 'http'
  / 'https'
  / 'hxxp'
  / 'hxxps'
  / 'shttp'
  / 'ftp'
  / 'sftp'
  / 'rsync'
  / 'tftp'
  / 'git'
  / 'svn'
  / 'file'
  / 'filesystem'
  / 'res'
  / 'resource'
  / 'appdata'
  / 'data'
  / 'redis'
  / 'service'

URL "url"
  = protocol:_UrlProtocol ":" [a-zA-Z0-9\!\*\'\(\)\:\;\@\&\=\+\$\,\/\?\#\[\]\_\.\~\-]+ {
  	return { term: "url", protocol, value: text(), location: location() };
  }
