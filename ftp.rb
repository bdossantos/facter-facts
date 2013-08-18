require 'facter'

Facter.add('ftp') do
  confine :kernel => 'Linux'

  ftp = Facter::Util::Resolution.exec("netstat -lntup | grep -c ':21'").to_i
  setcode { 'true' } if ftp > 0
end
