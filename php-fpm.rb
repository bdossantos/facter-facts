require 'facter'

Facter.add('php-fpm') do
  confine :kernel => 'Linux'

  Facter::Util::Resolution.exec('which php5-fpm &>/dev/null').to_i
  setcode { 'true' } if $?.exitstatus == 0
end
