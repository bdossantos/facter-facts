require 'facter'

Facter.add('postgresql') do
  confine :kernel => 'Linux'

  `hash psql 2>/dev/null`
  setcode { 'true' } if $?.exitstatus === 0
end
