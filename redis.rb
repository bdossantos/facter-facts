require 'facter'

Facter.add('redis') do
  confine :kernel => 'Linux'

  Facter::Util::Resolution.exec('which redis-server &>/dev/null').to_i
  setcode { 'true' } if $?.exitstatus == 0
end
