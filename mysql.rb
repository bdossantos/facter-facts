require 'facter'

Facter.add('mysql') do
  confine :kernel => 'Linux'

  `hash mysqld 2>/dev/null`
  setcode { 'true' } if $?.exitstatus === 0
end
