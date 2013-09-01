require 'facter'

Facter.add('mysql') do
  confine :kernel => 'Linux'

  Facter::Util::Resolution.exec('which mysqld &>/dev/null').to_i
  setcode { 'true' } if $?.exitstatus == 0
end
