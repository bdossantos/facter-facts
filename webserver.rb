require 'facter'

exit if Facter::value('kernel') != 'Linux'

Facter.add('http') do
  http = Facter::Util::Resolution.exec("netstat -lntup | grep -c ':80'").to_i
  setcode { 'true' } if http > 0
end

Facter.add('https') do
  https = Facter::Util::Resolution.exec("netstat -lntup | grep -c ':443'").to_i
  setcode { 'true' } if https > 0
end

['nginx', 'apache2', 'lighttpd'].each do |srv|
  `hash #{srv} 2>/dev/null`
  Facter.add(srv) { setcode { 'true' } } if $?.exitstatus === 0
end
